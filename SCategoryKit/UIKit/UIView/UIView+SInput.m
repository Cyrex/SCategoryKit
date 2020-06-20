//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIView+SInput.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/6/19: Created by Cyrex on 2020/6/19
//

#import "UIView+SInput.h"

static char S_INPUT_MODEL;
static char S_INPUT_DISABLE;

// MARK: -
// MARK: - SInputModel
@interface SInputModel ()

@property (nonatomic, weak) UIView *textView;

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeGesture;

@property (nonatomic, strong) NSValue *transformValue;

- (instancetype)initWithTextView:(UIView *)textView;

- (void)addObserverForKeyboard;

- (void)removeObserverForKeyboard;

- (void)addDismissGesture;

- (void)removeDismissGesture;

@end

@implementation SInputModel
// MARK: - Life Cycle
- (instancetype)initWithTextView:(UIView *)textView {
    if (self = [super init]) {
        _textView = textView;
    }

    return self;
}

- (void)dealloc {
    [self removeObserverForKeyboard];
    [self removeDismissGesture];
}


// MARK: - Public Methods
- (void)addObserverForKeyboard {
    if (self.transformView) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKeyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKeyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
}

- (void)removeObserverForKeyboard {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addDismissGesture {
    if (self.dismissView) {
        [self.dismissView addGestureRecognizer:self.tapGesture];
        [self.dismissView addGestureRecognizer:self.swipeGesture];
    }
}

- (void)removeDismissGesture {
    if (_dismissView) {
        if (_tapGesture) {
            [_dismissView removeGestureRecognizer:self.tapGesture];
        }
        if (_swipeGesture) {
            [_dismissView removeGestureRecognizer:self.swipeGesture];
        }
    }
}


// MARK: - Action Methods
- (void)onKeyboardWillShow:(NSNotification *)notification {
    if (self.transformView && [self.textView isFirstResponder]) {
        CGFloat height = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        NSTimeInterval duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        [self showKeyboardAnimationWithHeight:height duration:duration];
    }
}

- (void)onKeyboardWillHide:(NSNotification *)notification {
    if (self.transformView) {
        NSTimeInterval duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        [self hideKeyboardAnimationWithDuration:duration];
    }
}

- (void)onGesture {
    [self.textView resignFirstResponder];
}


// MARK: - Private Methods
- (void)showKeyboardAnimationWithHeight:(CGFloat)height duration:(NSTimeInterval)duration {

    UIView *visibleView = self.visibleView ?: self.textView;

    if (!self.transformValue) {
        self.transformValue = [NSValue valueWithCGAffineTransform:visibleView.transform];
    }

    CGRect rect = [visibleView convertRect:visibleView.bounds toView:visibleView.window];
    CGFloat offset = rect.origin.y + rect.size.height - (visibleView.window.bounds.size.height - height);
    if (offset > 0.f) {
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:duration animations:^{

            __strong typeof(weakSelf)self = weakSelf;
            self.transformView.transform = CGAffineTransformConcat(self.transformView.transform, CGAffineTransformMakeTranslation(0.f, -offset));
        }];
    }
}

- (void)hideKeyboardAnimationWithDuration:(NSTimeInterval)duration {
    if (self.transformValue) {
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:duration animations:^{
            __strong typeof(weakSelf)self = weakSelf;
            self.transformView.transform = [self.transformValue CGAffineTransformValue];
        } completion:^(BOOL finished) {

            __strong typeof(weakSelf)self = weakSelf;
            self.transformValue = nil;
        }];
    }
}


// MARK: - Getters
- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                              action:@selector(onGesture)];
    }

    return _tapGesture;
}

- (UISwipeGestureRecognizer *)swipeGesture {
    if (!_swipeGesture) {
        _swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                  action:@selector(onGesture)];
        _swipeGesture.direction = UISwipeGestureRecognizerDirectionDown;
    }

    return _swipeGesture;
}

@end


// MARK: -
// MARK: - UIView (SInput)
@implementation UIView (SInput)
// MARK: - Life Cycle
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self s_replaceMethod:[self class] oldSel:@selector(didMoveToSuperview) newSel:@selector(s_didMoveToSuperview)];
        [self s_replaceMethod:[self class] oldSel:@selector(removeFromSuperview) newSel:@selector(s_removeFromSuperview)];
        [self s_replaceMethod:[self class] oldSel:@selector(becomeFirstResponder) newSel:@selector(s_becomeFirstResponder)];
        [self s_replaceMethod:[self class] oldSel:@selector(resignFirstResponder) newSel:@selector(s_resignFirstResponder)];
    });
}

- (void)s_didMoveToSuperview {
    [self s_didMoveToSuperview];

    if ([self needInput]) {
        SInputModel *inputModel = [self s_inputModel];
        if (!inputModel.dismissView) {
            inputModel.dismissView = self.superview;
        }
        if (!inputModel.transformView) {
            inputModel.transformView = self.superview;
        }
        [inputModel addObserverForKeyboard];
    }
}

- (void)s_removeFromSuperview {
    [self s_removeFromSuperview];

    if ([self needInput]) {
        SInputModel *inputModel = [self s_inputModel];
        [inputModel removeObserverForKeyboard];
        inputModel.dismissView = nil;
        inputModel.transformView = nil;
        inputModel.visibleView = nil;
    }
}

- (BOOL)s_becomeFirstResponder {
    if ([self needInput]) {
        SInputModel *inputModel = [self s_inputModel];
        [inputModel addDismissGesture];
    }

    return [self s_becomeFirstResponder];
}

- (BOOL)s_resignFirstResponder {

    if ([self needInput]) {
        SInputModel *inputModel = [self s_inputModel];
        [inputModel removeDismissGesture];
    }

    return [self s_resignFirstResponder];
}

- (BOOL)needInput {
    if ([objc_getAssociatedObject(self, &S_INPUT_DISABLE) boolValue]) {
        return NO;
    }

    if ([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]]) {
        return YES;
    }

    return NO;
}

// MARK: - Public Methods
- (SInputModel *)s_inputModel {
    SInputModel *inputModel = (SInputModel *)objc_getAssociatedObject(self, &S_INPUT_MODEL);
    if (!inputModel) {
        inputModel = [[SInputModel alloc] initWithTextView:self];
        objc_setAssociatedObject(self,
                                 &S_INPUT_MODEL,
                                 inputModel,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    return inputModel;
}

- (void)s_changeInputEnable:(BOOL)inputEnable {
    objc_setAssociatedObject(self,
                             &S_INPUT_DISABLE,
                             @(!inputEnable),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)s_replaceMethod: (Class)classObj oldSel:(SEL)originSelector newSel:(SEL)newSelector {
    Method oriMethod = class_getInstanceMethod(classObj, originSelector);
    Method newMethod = class_getInstanceMethod(classObj, newSelector);
    BOOL isAddedMethod = class_addMethod(classObj, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAddedMethod) {
        class_replaceMethod(classObj, newSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, newMethod);
    }
}

@end
