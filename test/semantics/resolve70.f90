! C703 (R702) The derived-type-spec shall not specify an abstract type (7.5.7).
! This constraint refers to the derived-type-spec in a type-spec.  A type-spec
! can appear in an ALLOCATE statement, an ac-spec for an array constructor, and
! in the type specifier of a TYPE GUARD statement
!
! C706 TYPE(derived-type-spec) shall not specify an abstract type (7.5.7).
!   This is for a declaration-type-spec
!
! C796 (R756) The derived-type-spec shall not specify an abstract type (7.5.7).
!
! C705 (R703) In a declaration-type-spec that uses the CLASS keyword, 
! derived-type-spec shall specify an extensible type (7.5.7).
subroutine s()
  type, abstract :: abstractType
  end type abstractType

  type, extends(abstractType) :: concreteType
  end type concreteType

  ! declaration-type-spec
  !ERROR: ABSTRACT derived type may not be used here
  type (abstractType), allocatable :: abstractVar

  ! ac-spec for an array constructor
  !ERROR: ABSTRACT derived type may not be used here
  !ERROR: ABSTRACT derived type may not be used here
  type (abstractType), parameter :: abstractArray(*) = (/ abstractType :: /)

  class(*), allocatable :: selector

  ! Structure constructor
  !ERROR: ABSTRACT derived type may not be used here
  !ERROR: ABSTRACT derived type 'abstracttype' may not be used in a structure constructor
  type (abstractType) :: abstractVar1 = abstractType()

  ! Allocate statement
  !ERROR: ABSTRACT derived type may not be used here
  allocate(abstractType :: abstractVar)

  select type(selector)
    ! Type specifier for a type guard statement
    !ERROR: ABSTRACT derived type may not be used here
    type is (abstractType)
  end select
end subroutine s

subroutine s1()
  type :: extensible
  end type
  type, bind(c) :: inextensible
  end type

  ! This one's OK
  class(extensible) :: y

  !ERROR: Non-extensible derived type 'inextensible' may not be used with CLASS keyword
  class(inextensible) :: x
end subroutine s1