## Retryable 2.0.4 ##

*   :infinite value is now available as :tries paramater.  Use it for retrying your blocks infinitely until it stops failing.
*   :sleep_method parameter has been added. This can be very useful when you are working with Celluloid which implements its own version of the method sleep.
    Use `:sleep_method => Celluloid.method(:sleep)` in such cases.

## Retryable 2.0.3 ##

*   gemspec contains explicit licence option from now on(MIT)

## Retryable 2.0.2 ##

*   :not configuration option has been added for specifying exceptions
    when a retry should not be performed. Thanks @drunkel

## Retryable 2.0.1 ##

*   Retryable can now be configured globally via Retryable.configure block.

## Retryable 2.0.0 ##

*   Retryable can now be used without monkey patching Kernel module(use `Retryable.retryable` instead). Thanks @oppegard

## Retryable 1.3.6 ##

*   Fixed warning: assigned but unused variable - tries. Thanks @amatsuda

## Retryable 1.3.5 ##

*   New callback option(:exception_cb) to run after an rescued exception is introduced. Thanks @jondruse

## Retryable 1.3.4 ##

*   Namespace issue has been fixed. Thanks @darkhelmet

## Retryable 1.3.3 ##

*   Retryable::Version constant typo has been fixed

## Retryable 1.3.2 ##

*   Retryable.disable method has been added
*   Retryable.enabled method has been added

## Retryable 1.3.1 ##

*   :ensure retryable option add added

*   ArgumentError is raised instead of InvalidRetryableOptions in case of invalid option param for retryable block

## Retryable 1.3.0 ##

*   StandardError is now default exception for rescuing.

## Retryable 1.2.5 ##

*   became friendly to any rubygems version installed

## Retryable 1.2.4 ##

*   added :matching option + better options validation

## Retryable 1.2.3 ##

*   fixed dependencies

## Retryable 1.2.2 ##

*   added :sleep option

## Retryable 1.2.1 ##

*   stability -- Thoroughly unit-tested

## Retryable 1.2.0 ##

*   FIX -- block would run twice when `:tries` was set to `0`. (Thanks for the heads-up to [Tuker](http://github.com/tuker).)
