{$DEFINE QDAC}

{$IF RTLVersion<18}
{$MESSAGE Error '!!!QDAC Only test in 2007 and XE6,No support in other version!!!'}
{$IFEND <RadStudio2007}
{$IF RTLVersion>=24}
{$LEGACYIFEND ON}
{$IFEND}


