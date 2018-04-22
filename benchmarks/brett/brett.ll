target triple="i686"

%struct.thing = type {i32, i32, %struct.thing*}
@gi1 = common global i32 0, align 8
@gb1 = common global i32 0, align 8
@gs1 = common global %struct.thing* null, align 8
@counter = common global i32 0, align 8

define void @printgroup(i32 %_P_groupnum)
{

L2:
	%groupnum = alloca i32
	store i32 %_P_groupnum, i32* %groupnum
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r0 = load i32* %groupnum
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r0)
	br label %L3
L3:
	ret void
}

define i32 @setcounter(i32 %_P_val)
{

L5:
	%_retval_ = alloca i32
	%val = alloca i32
	store i32 %_P_val, i32* %val
	%r1 = load i32* %val
	store i32 %r1, i32* @counter
	%r2 = zext i1 1 to i32
	store i32 %r2, i32* %_retval_
	br label %L6
L6:
	%r3 = load i32* %_retval_
	ret i32 %r3
}

define void @takealltypes(i32 %_P_i, i32 %_P_b, %struct.thing* %_P_s)
{

L8:
	%i = alloca i32
	store i32 %_P_i, i32* %i
	%b = alloca i32
	store i32 %_P_b, i32* %b
	%s = alloca %struct.thing*
	store %struct.thing* %_P_s, %struct.thing** %s
	%r4 = load i32* %i
	%r5 = icmp eq i32 %r4, 3
	%r6 = zext i1 %r5 to i32
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L10, label %L11

L10:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L12
L11:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L12
L12:
	%r8 = load i32* %b
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L13, label %L14

L13:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L15
L14:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L15
L15:
	%r10 = load %struct.thing** %s
	%r11 = getelementptr %struct.thing* %r10, i1 0, i32 0
	%r12 = load i32* %r11
	%r13 = trunc i32 %r12 to i1
	br i1 %r13, label %L16, label %L17

L16:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L18
L17:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L18
L18:
	br label %L9
L9:
	ret void
}

define void @tonofargs(i32 %_P_a1, i32 %_P_a2, i32 %_P_a3, i32 %_P_a4, i32 %_P_a5, i32 %_P_a6, i32 %_P_a7, i32 %_P_a8)
{

L20:
	%a1 = alloca i32
	store i32 %_P_a1, i32* %a1
	%a2 = alloca i32
	store i32 %_P_a2, i32* %a2
	%a3 = alloca i32
	store i32 %_P_a3, i32* %a3
	%a4 = alloca i32
	store i32 %_P_a4, i32* %a4
	%a5 = alloca i32
	store i32 %_P_a5, i32* %a5
	%a6 = alloca i32
	store i32 %_P_a6, i32* %a6
	%a7 = alloca i32
	store i32 %_P_a7, i32* %a7
	%a8 = alloca i32
	store i32 %_P_a8, i32* %a8
	%r14 = load i32* %a5
	%r15 = icmp eq i32 %r14, 5
	%r16 = zext i1 %r15 to i32
	%r17 = trunc i32 %r16 to i1
	br i1 %r17, label %L22, label %L23

L22:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L24
L23:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r18 = load i32* %a5
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r18)
	br label %L24
L24:
	%r19 = load i32* %a6
	%r20 = icmp eq i32 %r19, 6
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L25, label %L26

L25:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L27
L26:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r23 = load i32* %a6
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r23)
	br label %L27
L27:
	%r24 = load i32* %a7
	%r25 = icmp eq i32 %r24, 7
	%r26 = zext i1 %r25 to i32
	%r27 = trunc i32 %r26 to i1
	br i1 %r27, label %L28, label %L29

L28:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L30
L29:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r28 = load i32* %a7
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r28)
	br label %L30
L30:
	%r29 = load i32* %a8
	%r30 = icmp eq i32 %r29, 8
	%r31 = zext i1 %r30 to i32
	%r32 = trunc i32 %r31 to i1
	br i1 %r32, label %L31, label %L32

L31:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L33
L32:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r33 = load i32* %a8
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r33)
	br label %L33
L33:
	br label %L21
L21:
	ret void
}

define i32 @returnint(i32 %_P_ret)
{

L35:
	%_retval_ = alloca i32
	%ret = alloca i32
	store i32 %_P_ret, i32* %ret
	%r34 = load i32* %ret
	store i32 %r34, i32* %_retval_
	br label %L36
L36:
	%r35 = load i32* %_retval_
	ret i32 %r35
}

define i32 @returnbool(i32 %_P_ret)
{

L38:
	%_retval_ = alloca i32
	%ret = alloca i32
	store i32 %_P_ret, i32* %ret
	%r36 = load i32* %ret
	store i32 %r36, i32* %_retval_
	br label %L39
L39:
	%r37 = load i32* %_retval_
	ret i32 %r37
}

define %struct.thing* @returnstruct(%struct.thing* %_P_ret)
{

L41:
	%_retval_ = alloca %struct.thing*
	%ret = alloca %struct.thing*
	store %struct.thing* %_P_ret, %struct.thing** %ret
	%r38 = load %struct.thing** %ret
	store %struct.thing* %r38, %struct.thing** %_retval_
	br label %L42
L42:
	%r39 = load %struct.thing** %_retval_
	ret %struct.thing* %r39
}

define i32 @main()
{

L44:
	%_retval_ = alloca i32
	%b1 = alloca i32
	%b2 = alloca i32
	%i1 = alloca i32
	%i2 = alloca i32
	%i3 = alloca i32
	%s1 = alloca %struct.thing*
	%s2 = alloca %struct.thing*
	store i32 0, i32* @counter
	call void @printgroup(i32 1 )
	%r40 = zext i1 0 to i32
	store i32 %r40, i32* %b1
	%r41 = zext i1 0 to i32
	store i32 %r41, i32* %b2
	%r42 = load i32* %b1
	%r43 = load i32* %b2
	%r44 = and i32 %r42, %r43
	%r45 = trunc i32 %r44 to i1
	br i1 %r45, label %L46, label %L47

L46:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L48
L47:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L48
L48:
	%r46 = zext i1 1 to i32
	store i32 %r46, i32* %b1
	%r47 = zext i1 0 to i32
	store i32 %r47, i32* %b2
	%r48 = load i32* %b1
	%r49 = load i32* %b2
	%r50 = and i32 %r48, %r49
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L49, label %L50

L49:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L51
L50:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L51
L51:
	%r52 = zext i1 0 to i32
	store i32 %r52, i32* %b1
	%r53 = zext i1 1 to i32
	store i32 %r53, i32* %b2
	%r54 = load i32* %b1
	%r55 = load i32* %b2
	%r56 = and i32 %r54, %r55
	%r57 = trunc i32 %r56 to i1
	br i1 %r57, label %L52, label %L53

L52:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L54
L53:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L54
L54:
	%r58 = zext i1 1 to i32
	store i32 %r58, i32* %b1
	%r59 = zext i1 1 to i32
	store i32 %r59, i32* %b2
	%r60 = load i32* %b1
	%r61 = load i32* %b2
	%r62 = and i32 %r60, %r61
	%r63 = trunc i32 %r62 to i1
	br i1 %r63, label %L55, label %L56

L55:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L57
L56:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L57
L57:
	store i32 0, i32* @counter
	call void @printgroup(i32 2 )
	%r64 = zext i1 1 to i32
	store i32 %r64, i32* %b1
	%r65 = zext i1 1 to i32
	store i32 %r65, i32* %b2
	%r66 = load i32* %b1
	%r67 = load i32* %b2
	%r68 = or i32 %r66, %r67
	%r69 = trunc i32 %r68 to i1
	br i1 %r69, label %L58, label %L59

L58:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L60
L59:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L60
L60:
	%r70 = zext i1 1 to i32
	store i32 %r70, i32* %b1
	%r71 = zext i1 0 to i32
	store i32 %r71, i32* %b2
	%r72 = load i32* %b1
	%r73 = load i32* %b2
	%r74 = or i32 %r72, %r73
	%r75 = trunc i32 %r74 to i1
	br i1 %r75, label %L61, label %L62

L61:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L63
L62:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L63
L63:
	%r76 = zext i1 0 to i32
	store i32 %r76, i32* %b1
	%r77 = zext i1 1 to i32
	store i32 %r77, i32* %b2
	%r78 = load i32* %b1
	%r79 = load i32* %b2
	%r80 = or i32 %r78, %r79
	%r81 = trunc i32 %r80 to i1
	br i1 %r81, label %L64, label %L65

L64:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L66
L65:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L66
L66:
	%r82 = zext i1 0 to i32
	store i32 %r82, i32* %b1
	%r83 = zext i1 0 to i32
	store i32 %r83, i32* %b2
	%r84 = load i32* %b1
	%r85 = load i32* %b2
	%r86 = or i32 %r84, %r85
	%r87 = trunc i32 %r86 to i1
	br i1 %r87, label %L67, label %L68

L67:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L69
L68:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L69
L69:
	call void @printgroup(i32 3 )
	%r88 = icmp sgt i32 42, 1
	%r89 = zext i1 %r88 to i32
	%r90 = trunc i32 %r89 to i1
	br i1 %r90, label %L70, label %L71

L70:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L72
L71:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L72
L72:
	%r91 = icmp sge i32 42, 1
	%r92 = zext i1 %r91 to i32
	%r93 = trunc i32 %r92 to i1
	br i1 %r93, label %L73, label %L74

L73:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L75
L74:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L75
L75:
	%r94 = icmp slt i32 42, 1
	%r95 = zext i1 %r94 to i32
	%r96 = trunc i32 %r95 to i1
	br i1 %r96, label %L76, label %L77

L76:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L78
L77:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L78
L78:
	%r97 = icmp sle i32 42, 1
	%r98 = zext i1 %r97 to i32
	%r99 = trunc i32 %r98 to i1
	br i1 %r99, label %L79, label %L80

L79:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L81
L80:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L81
L81:
	%r100 = icmp eq i32 42, 1
	%r101 = zext i1 %r100 to i32
	%r102 = trunc i32 %r101 to i1
	br i1 %r102, label %L82, label %L83

L82:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L84
L83:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L84
L84:
	%r103 = icmp ne i32 42, 1
	%r104 = zext i1 %r103 to i32
	%r105 = trunc i32 %r104 to i1
	br i1 %r105, label %L85, label %L86

L85:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L87
L86:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L87
L87:
	%r106 = zext i1 1 to i32
	%r107 = trunc i32 %r106 to i1
	br i1 %r107, label %L88, label %L89

L88:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L90
L89:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L90
L90:
	%r108 = zext i1 1 to i32
	%r109 = xor i32 %r108, 1
	%r110 = trunc i32 %r109 to i1
	br i1 %r110, label %L91, label %L92

L91:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L93
L92:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L93
L93:
	%r111 = zext i1 0 to i32
	%r112 = trunc i32 %r111 to i1
	br i1 %r112, label %L94, label %L95

L94:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L96
L95:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L96
L96:
	%r113 = zext i1 0 to i32
	%r114 = xor i32 %r113, 1
	%r115 = trunc i32 %r114 to i1
	br i1 %r115, label %L97, label %L98

L97:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L99
L98:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L99
L99:
	%r116 = zext i1 0 to i32
	%r117 = xor i32 %r116, 1
	%r118 = trunc i32 %r117 to i1
	br i1 %r118, label %L100, label %L101

L100:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L102
L101:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L102
L102:
	call void @printgroup(i32 4 )
	%r119 = add i32 2, 3
	%r120 = icmp eq i32 %r119, 5
	%r121 = zext i1 %r120 to i32
	%r122 = trunc i32 %r121 to i1
	br i1 %r122, label %L103, label %L104

L103:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L105
L104:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r123 = add i32 2, 3
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r123)
	br label %L105
L105:
	%r124 = mul i32 2, 3
	%r125 = icmp eq i32 %r124, 6
	%r126 = zext i1 %r125 to i32
	%r127 = trunc i32 %r126 to i1
	br i1 %r127, label %L106, label %L107

L106:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L108
L107:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r128 = mul i32 2, 3
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r128)
	br label %L108
L108:
	%r129 = sub i32 3, 2
	%r130 = icmp eq i32 %r129, 1
	%r131 = zext i1 %r130 to i32
	%r132 = trunc i32 %r131 to i1
	br i1 %r132, label %L109, label %L110

L109:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L111
L110:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r133 = sub i32 3, 2
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r133)
	br label %L111
L111:
	%r134 = sdiv i32 6, 3
	%r135 = icmp eq i32 %r134, 2
	%r136 = zext i1 %r135 to i32
	%r137 = trunc i32 %r136 to i1
	br i1 %r137, label %L112, label %L113

L112:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L114
L113:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r138 = sdiv i32 6, 3
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r138)
	br label %L114
L114:
	%r139 = sub i32 0, 6
	%r140 = icmp slt i32 %r139, 0
	%r141 = zext i1 %r140 to i32
	%r142 = trunc i32 %r141 to i1
	br i1 %r142, label %L115, label %L116

L115:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L117
L116:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L117
L117:
	call void @printgroup(i32 5 )
	store i32 42, i32* %i1
	%r143 = load i32* %i1
	%r144 = icmp eq i32 %r143, 42
	%r145 = zext i1 %r144 to i32
	%r146 = trunc i32 %r145 to i1
	br i1 %r146, label %L118, label %L119

L118:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L120
L119:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L120
L120:
	store i32 3, i32* %i1
	store i32 2, i32* %i2
	%r147 = load i32* %i1
	%r148 = load i32* %i2
	%r149 = add i32 %r147, %r148
	store i32 %r149, i32* %i3
	%r150 = load i32* %i3
	%r151 = icmp eq i32 %r150, 5
	%r152 = zext i1 %r151 to i32
	%r153 = trunc i32 %r152 to i1
	br i1 %r153, label %L121, label %L122

L121:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L123
L122:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L123
L123:
	%r154 = zext i1 1 to i32
	store i32 %r154, i32* %b1
	%r155 = load i32* %b1
	%r156 = trunc i32 %r155 to i1
	br i1 %r156, label %L124, label %L125

L124:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L126
L125:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L126
L126:
	%r157 = load i32* %b1
	%r158 = xor i32 %r157, 1
	%r159 = trunc i32 %r158 to i1
	br i1 %r159, label %L127, label %L128

L127:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L129
L128:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L129
L129:
	%r160 = zext i1 0 to i32
	store i32 %r160, i32* %b1
	%r161 = load i32* %b1
	%r162 = trunc i32 %r161 to i1
	br i1 %r162, label %L130, label %L131

L130:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L132
L131:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L132
L132:
	%r163 = load i32* %b1
	%r164 = xor i32 %r163, 1
	%r165 = trunc i32 %r164 to i1
	br i1 %r165, label %L133, label %L134

L133:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L135
L134:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L135
L135:
	%r166 = load i32* %b1
	%r167 = trunc i32 %r166 to i1
	br i1 %r167, label %L136, label %L137

L136:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L138
L137:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L138
L138:
	call void @printgroup(i32 6 )
	store i32 0, i32* %i1
	%r174 = load i32* %i1
	%r175 = icmp slt i32 %r174, 5
	%r176 = zext i1 %r175 to i32
	%r177 = trunc i32 %r176 to i1
	br i1 %r177, label %L139, label %L143

L140:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L142
L141:
	br label %L142
L142:
	%r172 = load i32* %i1
	%r173 = add i32 %r172, 5
	store i32 %r173, i32* %i1
	%r178 = load i32* %i1
	%r179 = icmp slt i32 %r178, 5
	%r180 = zext i1 %r179 to i32
	%r181 = trunc i32 %r180 to i1
	br i1 %r181, label %L139, label %L143

L139:
	%r168 = load i32* %i1
	%r169 = icmp sge i32 %r168, 5
	%r170 = zext i1 %r169 to i32
	%r171 = trunc i32 %r170 to i1
	br i1 %r171, label %L140, label %L141

L143:
	%r182 = load i32* %i1
	%r183 = icmp eq i32 %r182, 5
	%r184 = zext i1 %r183 to i32
	%r185 = trunc i32 %r184 to i1
	br i1 %r185, label %L144, label %L145

L144:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L146
L145:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r186 = load i32* %i1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r186)
	br label %L146
L146:
	call void @printgroup(i32 7 )
	%r187 = call i8* @malloc(i32 24)
	%r188 = bitcast i8* %r187 to %struct.thing*
	store %struct.thing* %r188, %struct.thing** %s1
	%r189 = load %struct.thing** %s1
	%r190 = getelementptr %struct.thing* %r189, i1 0, i32 1
	store i32 42, i32* %r190
	%r191 = load %struct.thing** %s1
	%r192 = getelementptr %struct.thing* %r191, i1 0, i32 0
	%r193 = zext i1 1 to i32
	store i32 %r193, i32* %r192
	%r194 = load %struct.thing** %s1
	%r195 = getelementptr %struct.thing* %r194, i1 0, i32 1
	%r196 = load i32* %r195
	%r197 = icmp eq i32 %r196, 42
	%r198 = zext i1 %r197 to i32
	%r199 = trunc i32 %r198 to i1
	br i1 %r199, label %L147, label %L148

L147:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L149
L148:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r200 = load %struct.thing** %s1
	%r201 = getelementptr %struct.thing* %r200, i1 0, i32 1
	%r202 = load i32* %r201
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r202)
	br label %L149
L149:
	%r203 = load %struct.thing** %s1
	%r204 = getelementptr %struct.thing* %r203, i1 0, i32 0
	%r205 = load i32* %r204
	%r206 = trunc i32 %r205 to i1
	br i1 %r206, label %L150, label %L151

L150:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L152
L151:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L152
L152:
	%r207 = load %struct.thing** %s1
	%r208 = getelementptr %struct.thing* %r207, i1 0, i32 2
	%r209 = call i8* @malloc(i32 24)
	%r210 = bitcast i8* %r209 to %struct.thing*
	store %struct.thing* %r210, %struct.thing** %r208
	%r211 = load %struct.thing** %s1
	%r212 = getelementptr %struct.thing* %r211, i1 0, i32 2
	%r213 = load %struct.thing** %r212
	%r214 = getelementptr %struct.thing* %r213, i1 0, i32 1
	store i32 13, i32* %r214
	%r215 = load %struct.thing** %s1
	%r216 = getelementptr %struct.thing* %r215, i1 0, i32 2
	%r217 = load %struct.thing** %r216
	%r218 = getelementptr %struct.thing* %r217, i1 0, i32 0
	%r219 = zext i1 0 to i32
	store i32 %r219, i32* %r218
	%r220 = load %struct.thing** %s1
	%r221 = getelementptr %struct.thing* %r220, i1 0, i32 2
	%r222 = load %struct.thing** %r221
	%r223 = getelementptr %struct.thing* %r222, i1 0, i32 1
	%r224 = load i32* %r223
	%r225 = icmp eq i32 %r224, 13
	%r226 = zext i1 %r225 to i32
	%r227 = trunc i32 %r226 to i1
	br i1 %r227, label %L153, label %L154

L153:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L155
L154:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r228 = load %struct.thing** %s1
	%r229 = getelementptr %struct.thing* %r228, i1 0, i32 2
	%r230 = load %struct.thing** %r229
	%r231 = getelementptr %struct.thing* %r230, i1 0, i32 1
	%r232 = load i32* %r231
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r232)
	br label %L155
L155:
	%r233 = load %struct.thing** %s1
	%r234 = getelementptr %struct.thing* %r233, i1 0, i32 2
	%r235 = load %struct.thing** %r234
	%r236 = getelementptr %struct.thing* %r235, i1 0, i32 0
	%r237 = load i32* %r236
	%r238 = xor i32 %r237, 1
	%r239 = trunc i32 %r238 to i1
	br i1 %r239, label %L156, label %L157

L156:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L158
L157:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L158
L158:
	%r240 = load %struct.thing** %s1
	%r241 = load %struct.thing** %s1
	%r242 = icmp eq %struct.thing* %r240, %r241
	%r243 = zext i1 %r242 to i32
	%r244 = trunc i32 %r243 to i1
	br i1 %r244, label %L159, label %L160

L159:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L161
L160:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L161
L161:
	%r245 = load %struct.thing** %s1
	%r246 = load %struct.thing** %s1
	%r247 = getelementptr %struct.thing* %r246, i1 0, i32 2
	%r248 = load %struct.thing** %r247
	%r249 = icmp ne %struct.thing* %r245, %r248
	%r250 = zext i1 %r249 to i32
	%r251 = trunc i32 %r250 to i1
	br i1 %r251, label %L162, label %L163

L162:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L164
L163:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L164
L164:
	%r253 = load %struct.thing** %s1
	%r254 = getelementptr %struct.thing* %r253, i1 0, i32 2
	%r255 = load %struct.thing** %r254
	%r252 = bitcast %struct.thing* %r255 to i8*
	call void @free(i8* %r252 )
	%r257 = load %struct.thing** %s1
	%r256 = bitcast %struct.thing* %r257 to i8*
	call void @free(i8* %r256 )
	call void @printgroup(i32 8 )
	store i32 7, i32* @gi1
	%r258 = load i32* @gi1
	%r259 = icmp eq i32 %r258, 7
	%r260 = zext i1 %r259 to i32
	%r261 = trunc i32 %r260 to i1
	br i1 %r261, label %L165, label %L166

L165:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L167
L166:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r262 = load i32* @gi1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r262)
	br label %L167
L167:
	%r263 = zext i1 1 to i32
	store i32 %r263, i32* @gb1
	%r264 = load i32* @gb1
	%r265 = trunc i32 %r264 to i1
	br i1 %r265, label %L168, label %L169

L168:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L170
L169:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L170
L170:
	%r266 = call i8* @malloc(i32 24)
	%r267 = bitcast i8* %r266 to %struct.thing*
	store %struct.thing* %r267, %struct.thing** @gs1
	%r268 = load %struct.thing** @gs1
	%r269 = getelementptr %struct.thing* %r268, i1 0, i32 1
	store i32 34, i32* %r269
	%r270 = load %struct.thing** @gs1
	%r271 = getelementptr %struct.thing* %r270, i1 0, i32 0
	%r272 = zext i1 0 to i32
	store i32 %r272, i32* %r271
	%r273 = load %struct.thing** @gs1
	%r274 = getelementptr %struct.thing* %r273, i1 0, i32 1
	%r275 = load i32* %r274
	%r276 = icmp eq i32 %r275, 34
	%r277 = zext i1 %r276 to i32
	%r278 = trunc i32 %r277 to i1
	br i1 %r278, label %L171, label %L172

L171:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L173
L172:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r279 = load %struct.thing** @gs1
	%r280 = getelementptr %struct.thing* %r279, i1 0, i32 1
	%r281 = load i32* %r280
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r281)
	br label %L173
L173:
	%r282 = load %struct.thing** @gs1
	%r283 = getelementptr %struct.thing* %r282, i1 0, i32 0
	%r284 = load i32* %r283
	%r285 = xor i32 %r284, 1
	%r286 = trunc i32 %r285 to i1
	br i1 %r286, label %L174, label %L175

L174:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L176
L175:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L176
L176:
	%r287 = load %struct.thing** @gs1
	%r288 = getelementptr %struct.thing* %r287, i1 0, i32 2
	%r289 = call i8* @malloc(i32 24)
	%r290 = bitcast i8* %r289 to %struct.thing*
	store %struct.thing* %r290, %struct.thing** %r288
	%r291 = load %struct.thing** @gs1
	%r292 = getelementptr %struct.thing* %r291, i1 0, i32 2
	%r293 = load %struct.thing** %r292
	%r294 = getelementptr %struct.thing* %r293, i1 0, i32 1
	store i32 16, i32* %r294
	%r295 = load %struct.thing** @gs1
	%r296 = getelementptr %struct.thing* %r295, i1 0, i32 2
	%r297 = load %struct.thing** %r296
	%r298 = getelementptr %struct.thing* %r297, i1 0, i32 0
	%r299 = zext i1 1 to i32
	store i32 %r299, i32* %r298
	%r300 = load %struct.thing** @gs1
	%r301 = getelementptr %struct.thing* %r300, i1 0, i32 2
	%r302 = load %struct.thing** %r301
	%r303 = getelementptr %struct.thing* %r302, i1 0, i32 1
	%r304 = load i32* %r303
	%r305 = icmp eq i32 %r304, 16
	%r306 = zext i1 %r305 to i32
	%r307 = trunc i32 %r306 to i1
	br i1 %r307, label %L177, label %L178

L177:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L179
L178:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r308 = load %struct.thing** @gs1
	%r309 = getelementptr %struct.thing* %r308, i1 0, i32 2
	%r310 = load %struct.thing** %r309
	%r311 = getelementptr %struct.thing* %r310, i1 0, i32 1
	%r312 = load i32* %r311
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r312)
	br label %L179
L179:
	%r313 = load %struct.thing** @gs1
	%r314 = getelementptr %struct.thing* %r313, i1 0, i32 2
	%r315 = load %struct.thing** %r314
	%r316 = getelementptr %struct.thing* %r315, i1 0, i32 0
	%r317 = load i32* %r316
	%r318 = trunc i32 %r317 to i1
	br i1 %r318, label %L180, label %L181

L180:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L182
L181:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L182
L182:
	%r320 = load %struct.thing** @gs1
	%r321 = getelementptr %struct.thing* %r320, i1 0, i32 2
	%r322 = load %struct.thing** %r321
	%r319 = bitcast %struct.thing* %r322 to i8*
	call void @free(i8* %r319 )
	%r324 = load %struct.thing** @gs1
	%r323 = bitcast %struct.thing* %r324 to i8*
	call void @free(i8* %r323 )
	call void @printgroup(i32 9 )
	%r325 = call i8* @malloc(i32 24)
	%r326 = bitcast i8* %r325 to %struct.thing*
	store %struct.thing* %r326, %struct.thing** %s1
	%r327 = load %struct.thing** %s1
	%r328 = getelementptr %struct.thing* %r327, i1 0, i32 0
	%r329 = zext i1 1 to i32
	store i32 %r329, i32* %r328
	%r330 = zext i1 1 to i32
	%r331 = load %struct.thing** %s1
	call void @takealltypes(i32 3, i32 %r330, %struct.thing* %r331 )
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 2)
	call void @tonofargs(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8 )
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r332 = call i32 @returnint(i32 3 )
	store i32 %r332, i32* %i1
	%r333 = load i32* %i1
	%r334 = icmp eq i32 %r333, 3
	%r335 = zext i1 %r334 to i32
	%r336 = trunc i32 %r335 to i1
	br i1 %r336, label %L183, label %L184

L183:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L185
L184:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r337 = load i32* %i1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r337)
	br label %L185
L185:
	%r338 = zext i1 1 to i32
	%r339 = call i32 @returnbool(i32 %r338 )
	store i32 %r339, i32* %b1
	%r340 = load i32* %b1
	%r341 = trunc i32 %r340 to i1
	br i1 %r341, label %L186, label %L187

L186:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L188
L187:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L188
L188:
	%r342 = call i8* @malloc(i32 24)
	%r343 = bitcast i8* %r342 to %struct.thing*
	store %struct.thing* %r343, %struct.thing** %s1
	%r344 = load %struct.thing** %s1
	%r345 = call %struct.thing* @returnstruct(%struct.thing* %r344 )
	store %struct.thing* %r345, %struct.thing** %s2
	%r346 = load %struct.thing** %s1
	%r347 = load %struct.thing** %s2
	%r348 = icmp eq %struct.thing* %r346, %r347
	%r349 = zext i1 %r348 to i32
	%r350 = trunc i32 %r349 to i1
	br i1 %r350, label %L189, label %L190

L189:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L191
L190:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L191
L191:
	call void @printgroup(i32 10 )
	store i32 0, i32* %_retval_
	br label %L45
L45:
	%r351 = load i32* %_retval_
	ret i32 %r351
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8