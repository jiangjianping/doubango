# This file was automatically generated by SWIG (http://www.swig.org).
# Version 1.3.39
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

package tinyWRAP;
use base qw(Exporter);
use base qw(DynaLoader);
package tinyWRAPc;
bootstrap tinyWRAP;
package tinyWRAP;
@EXPORT = qw();

# ---------- BASE METHODS -------------

package tinyWRAP;

sub TIEHASH {
    my ($classname,$obj) = @_;
    return bless $obj, $classname;
}

sub CLEAR { }

sub FIRSTKEY { }

sub NEXTKEY { }

sub FETCH {
    my ($self,$field) = @_;
    my $member_func = "swig_${field}_get";
    $self->$member_func();
}

sub STORE {
    my ($self,$field,$newval) = @_;
    my $member_func = "swig_${field}_set";
    $self->$member_func($newval);
}

sub this {
    my $ptr = shift;
    return tied(%$ptr);
}


# ------- FUNCTION WRAPPERS --------

package tinyWRAP;


############# Class : tinyWRAP::SipUri ##############

package tinyWRAP::SipUri;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SipUri(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SipUri($self);
        delete $OWNER{$self};
    }
}

*isValid = *tinyWRAPc::SipUri_isValid;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::SipEvent ##############

package tinyWRAP::SipEvent;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SipEvent(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SipEvent($self);
        delete $OWNER{$self};
    }
}

*getCode = *tinyWRAPc::SipEvent_getCode;
*getPhrase = *tinyWRAPc::SipEvent_getPhrase;
*getBaseSession = *tinyWRAPc::SipEvent_getBaseSession;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::SipSession ##############

package tinyWRAP::SipSession;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SipSession(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SipSession($self);
        delete $OWNER{$self};
    }
}

*addHeader = *tinyWRAPc::SipSession_addHeader;
*removeHeader = *tinyWRAPc::SipSession_removeHeader;
*addCaps = *tinyWRAPc::SipSession_addCaps;
*removeCaps = *tinyWRAPc::SipSession_removeCaps;
*setExpires = *tinyWRAPc::SipSession_setExpires;
*setFromUri = *tinyWRAPc::SipSession_setFromUri;
*setToUri = *tinyWRAPc::SipSession_setToUri;
*setPayload = *tinyWRAPc::SipSession_setPayload;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::RegistrationEvent ##############

package tinyWRAP::RegistrationEvent;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP::SipEvent tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_RegistrationEvent(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_RegistrationEvent($self);
        delete $OWNER{$self};
    }
}

*getType = *tinyWRAPc::RegistrationEvent_getType;
*getSession = *tinyWRAPc::RegistrationEvent_getSession;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::RegistrationSession ##############

package tinyWRAP::RegistrationSession;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP::SipSession tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_RegistrationSession(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_RegistrationSession($self);
        delete $OWNER{$self};
    }
}

*Register = *tinyWRAPc::RegistrationSession_Register;
*UnRegister = *tinyWRAPc::RegistrationSession_UnRegister;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::SubscriptionEvent ##############

package tinyWRAP::SubscriptionEvent;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP::SipEvent tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SubscriptionEvent(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SubscriptionEvent($self);
        delete $OWNER{$self};
    }
}

*getType = *tinyWRAPc::SubscriptionEvent_getType;
*getSession = *tinyWRAPc::SubscriptionEvent_getSession;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::SubscriptionSession ##############

package tinyWRAP::SubscriptionSession;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP::SipSession tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SubscriptionSession(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SubscriptionSession($self);
        delete $OWNER{$self};
    }
}

*Subscribe = *tinyWRAPc::SubscriptionSession_Subscribe;
*UnSubscribe = *tinyWRAPc::SubscriptionSession_UnSubscribe;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::SipCallback ##############

package tinyWRAP::SipCallback;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SipCallback(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SipCallback($self);
        delete $OWNER{$self};
    }
}

*OnRegistrationChanged = *tinyWRAPc::SipCallback_OnRegistrationChanged;
*OnSubscriptionChanged = *tinyWRAPc::SipCallback_OnSubscriptionChanged;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::SafeObject ##############

package tinyWRAP::SafeObject;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SafeObject(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SafeObject($self);
        delete $OWNER{$self};
    }
}

*Lock = *tinyWRAPc::SafeObject_Lock;
*UnLock = *tinyWRAPc::SafeObject_UnLock;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : tinyWRAP::SipStack ##############

package tinyWRAP::SipStack;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( tinyWRAP::SafeObject tinyWRAP );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = tinyWRAPc::new_SipStack(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        tinyWRAPc::delete_SipStack($self);
        delete $OWNER{$self};
    }
}

*start = *tinyWRAPc::SipStack_start;
*setRealm = *tinyWRAPc::SipStack_setRealm;
*setIMPI = *tinyWRAPc::SipStack_setIMPI;
*setIMPU = *tinyWRAPc::SipStack_setIMPU;
*setPassword = *tinyWRAPc::SipStack_setPassword;
*setProxyCSCF = *tinyWRAPc::SipStack_setProxyCSCF;
*setLocalIP = *tinyWRAPc::SipStack_setLocalIP;
*setLocalPort = *tinyWRAPc::SipStack_setLocalPort;
*addHeader = *tinyWRAPc::SipStack_addHeader;
*removeHeader = *tinyWRAPc::SipStack_removeHeader;
*isValid = *tinyWRAPc::SipStack_isValid;
*stop = *tinyWRAPc::SipStack_stop;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


# ------- VARIABLE STUBS --------

package tinyWRAP;

*tsip_event_invite = *tinyWRAPc::tsip_event_invite;
*tsip_event_message = *tinyWRAPc::tsip_event_message;
*tsip_event_options = *tinyWRAPc::tsip_event_options;
*tsip_event_publish = *tinyWRAPc::tsip_event_publish;
*tsip_event_register = *tinyWRAPc::tsip_event_register;
*tsip_event_subscribe = *tinyWRAPc::tsip_event_subscribe;
*tsip_event_dialog = *tinyWRAPc::tsip_event_dialog;
*tsip_i_register = *tinyWRAPc::tsip_i_register;
*tsip_ai_register = *tinyWRAPc::tsip_ai_register;
*tsip_o_register = *tinyWRAPc::tsip_o_register;
*tsip_ao_register = *tinyWRAPc::tsip_ao_register;
*tsip_i_unregister = *tinyWRAPc::tsip_i_unregister;
*tsip_ai_unregister = *tinyWRAPc::tsip_ai_unregister;
*tsip_o_unregister = *tinyWRAPc::tsip_o_unregister;
*tsip_ao_unregister = *tinyWRAPc::tsip_ao_unregister;
*tsip_i_subscribe = *tinyWRAPc::tsip_i_subscribe;
*tsip_ai_subscribe = *tinyWRAPc::tsip_ai_subscribe;
*tsip_o_subscribe = *tinyWRAPc::tsip_o_subscribe;
*tsip_ao_subscribe = *tinyWRAPc::tsip_ao_subscribe;
*tsip_i_unsubscribe = *tinyWRAPc::tsip_i_unsubscribe;
*tsip_ai_unsubscribe = *tinyWRAPc::tsip_ai_unsubscribe;
*tsip_o_unsubscribe = *tinyWRAPc::tsip_o_unsubscribe;
*tsip_ao_unsubscribe = *tinyWRAPc::tsip_ao_unsubscribe;
*tsip_i_notify = *tinyWRAPc::tsip_i_notify;
*tsip_ai_notify = *tinyWRAPc::tsip_ai_notify;
*tsip_o_notify = *tinyWRAPc::tsip_o_notify;
*tsip_ao_notify = *tinyWRAPc::tsip_ao_notify;
1;
