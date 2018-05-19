target triple="i686"

%struct.thing = type {i32, i32, %struct.thing*}
@gi1 = common global i32 0, align 8
@gb1 = common global i32 0, align 8
@gs1 = common global %struct.thing* null, align 8
@counter = common global i32 0, align 8

define void @printgroup(i32 %groupnum)
{

L1:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %groupnum)
	br label %L2
L2:
	ret void
}

define i32 @setcounter(i32 %val)
{

L4:
	store i32 %val, i32* @counter
	%r0 = zext i1 1 to i32
	br label %L5
L5:
	%phi0 = phi i32 [%r0, %L4]
	ret i32 %phi0
}

define void @takealltypes(i32 %i, i32 %b, %struct.thing* %s)
{

L7:
	%r1 = icmp eq i32 %i, 3
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L9, label %L10

L9:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L11
L10:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L11
L11:
	%phi1 = phi i32 [%b, %L9], [%b, %L10]
	%phi3 = phi %struct.thing* [%s, %L9], [%s, %L10]
	%r4 = trunc i32 %phi1 to i1
	br i1 %r4, label %L12, label %L13

L12:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L14
L13:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L14
L14:
	%phi2 = phi %struct.thing* [%phi3, %L12], [%phi3, %L13]
	%r5 = getelementptr %struct.thing , %struct.thing* %phi2, i1 0, i32 0
	%r6 = load i32, i32* %r5
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L15, label %L16

L15:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L17
L16:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L17
L17:
	br label %L8
L8:
	ret void
}

define void @tonofargs(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8)
{

L19:
	%r8 = icmp eq i32 %a5, 5
	%r9 = zext i1 %r8 to i32
	%r10 = trunc i32 %r9 to i1
	br i1 %r10, label %L21, label %L22

L21:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L23
L22:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %a5)
	br label %L23
L23:
	%phi4 = phi i32 [%a6, %L21], [%a6, %L22]
	%phi6 = phi i32 [%a7, %L21], [%a7, %L22]
	%phi9 = phi i32 [%a8, %L21], [%a8, %L22]
	%r11 = icmp eq i32 %phi4, 6
	%r12 = zext i1 %r11 to i32
	%r13 = trunc i32 %r12 to i1
	br i1 %r13, label %L24, label %L25

L24:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L26
L25:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi4)
	br label %L26
L26:
	%phi5 = phi i32 [%phi6, %L24], [%phi6, %L25]
	%phi8 = phi i32 [%phi9, %L24], [%phi9, %L25]
	%r14 = icmp eq i32 %phi5, 7
	%r15 = zext i1 %r14 to i32
	%r16 = trunc i32 %r15 to i1
	br i1 %r16, label %L27, label %L28

L27:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L29
L28:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi5)
	br label %L29
L29:
	%phi7 = phi i32 [%phi8, %L27], [%phi8, %L28]
	%r17 = icmp eq i32 %phi7, 8
	%r18 = zext i1 %r17 to i32
	%r19 = trunc i32 %r18 to i1
	br i1 %r19, label %L30, label %L31

L30:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L32
L31:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi7)
	br label %L32
L32:
	br label %L20
L20:
	ret void
}

define i32 @returnint(i32 %ret)
{

L34:
	br label %L35
L35:
	%phi10 = phi i32 [%ret, %L34]
	ret i32 %phi10
}

define i32 @returnbool(i32 %ret)
{

L37:
	br label %L38
L38:
	%phi11 = phi i32 [%ret, %L37]
	ret i32 %phi11
}

define %struct.thing* @returnstruct(%struct.thing* %ret)
{

L40:
	br label %L41
L41:
	%phi12 = phi %struct.thing* [%ret, %L40]
	ret %struct.thing* %phi12
}

define i32 @main()
{

L43:
	store i32 0, i32* @counter
	call void @printgroup(i32 1 )
	%r20 = zext i1 0 to i32
	%r21 = zext i1 0 to i32
	%r22 = and i32 %r20, %r21
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L45, label %L46

L45:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L47
L46:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L47
L47:
	%r24 = zext i1 1 to i32
	%r25 = zext i1 0 to i32
	%r26 = and i32 %r24, %r25
	%r27 = trunc i32 %r26 to i1
	br i1 %r27, label %L48, label %L49

L48:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L50
L49:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L50
L50:
	%r28 = zext i1 0 to i32
	%r29 = zext i1 1 to i32
	%r30 = and i32 %r28, %r29
	%r31 = trunc i32 %r30 to i1
	br i1 %r31, label %L51, label %L52

L51:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L53
L52:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L53
L53:
	%r32 = zext i1 1 to i32
	%r33 = zext i1 1 to i32
	%r34 = and i32 %r32, %r33
	%r35 = trunc i32 %r34 to i1
	br i1 %r35, label %L54, label %L55

L54:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L56
L55:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L56
L56:
	store i32 0, i32* @counter
	call void @printgroup(i32 2 )
	%r36 = zext i1 1 to i32
	%r37 = zext i1 1 to i32
	%r38 = or i32 %r36, %r37
	%r39 = trunc i32 %r38 to i1
	br i1 %r39, label %L57, label %L58

L57:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L59
L58:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L59
L59:
	%r40 = zext i1 1 to i32
	%r41 = zext i1 0 to i32
	%r42 = or i32 %r40, %r41
	%r43 = trunc i32 %r42 to i1
	br i1 %r43, label %L60, label %L61

L60:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L62
L61:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L62
L62:
	%r44 = zext i1 0 to i32
	%r45 = zext i1 1 to i32
	%r46 = or i32 %r44, %r45
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L63, label %L64

L63:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L65
L64:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L65
L65:
	%r48 = zext i1 0 to i32
	%r49 = zext i1 0 to i32
	%r50 = or i32 %r48, %r49
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L66, label %L67

L66:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L68
L67:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L68
L68:
	call void @printgroup(i32 3 )
	%r52 = icmp sgt i32 42, 1
	%r53 = zext i1 %r52 to i32
	%r54 = trunc i32 %r53 to i1
	br i1 %r54, label %L69, label %L70

L69:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L71
L70:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L71
L71:
	%r55 = icmp sge i32 42, 1
	%r56 = zext i1 %r55 to i32
	%r57 = trunc i32 %r56 to i1
	br i1 %r57, label %L72, label %L73

L72:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L74
L73:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L74
L74:
	%r58 = icmp slt i32 42, 1
	%r59 = zext i1 %r58 to i32
	%r60 = trunc i32 %r59 to i1
	br i1 %r60, label %L75, label %L76

L75:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L77
L76:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L77
L77:
	%r61 = icmp sle i32 42, 1
	%r62 = zext i1 %r61 to i32
	%r63 = trunc i32 %r62 to i1
	br i1 %r63, label %L78, label %L79

L78:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L80
L79:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L80
L80:
	%r64 = icmp eq i32 42, 1
	%r65 = zext i1 %r64 to i32
	%r66 = trunc i32 %r65 to i1
	br i1 %r66, label %L81, label %L82

L81:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L83
L82:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L83
L83:
	%r67 = icmp ne i32 42, 1
	%r68 = zext i1 %r67 to i32
	%r69 = trunc i32 %r68 to i1
	br i1 %r69, label %L84, label %L85

L84:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L86
L85:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L86
L86:
	%r70 = zext i1 1 to i32
	%r71 = trunc i32 %r70 to i1
	br i1 %r71, label %L87, label %L88

L87:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L89
L88:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L89
L89:
	%r72 = zext i1 1 to i32
	%r73 = xor i32 %r72, 1
	%r74 = trunc i32 %r73 to i1
	br i1 %r74, label %L90, label %L91

L90:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L92
L91:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L92
L92:
	%r75 = zext i1 0 to i32
	%r76 = trunc i32 %r75 to i1
	br i1 %r76, label %L93, label %L94

L93:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L95
L94:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L95
L95:
	%r77 = zext i1 0 to i32
	%r78 = xor i32 %r77, 1
	%r79 = trunc i32 %r78 to i1
	br i1 %r79, label %L96, label %L97

L96:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L98
L97:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L98
L98:
	%r80 = zext i1 0 to i32
	%r81 = xor i32 %r80, 1
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L99, label %L100

L99:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L101
L100:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L101
L101:
	call void @printgroup(i32 4 )
	%r83 = add i32 2, 3
	%r84 = icmp eq i32 %r83, 5
	%r85 = zext i1 %r84 to i32
	%r86 = trunc i32 %r85 to i1
	br i1 %r86, label %L102, label %L103

L102:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L104
L103:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r87 = add i32 2, 3
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r87)
	br label %L104
L104:
	%r88 = mul i32 2, 3
	%r89 = icmp eq i32 %r88, 6
	%r90 = zext i1 %r89 to i32
	%r91 = trunc i32 %r90 to i1
	br i1 %r91, label %L105, label %L106

L105:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L107
L106:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r92 = mul i32 2, 3
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r92)
	br label %L107
L107:
	%r93 = sub i32 3, 2
	%r94 = icmp eq i32 %r93, 1
	%r95 = zext i1 %r94 to i32
	%r96 = trunc i32 %r95 to i1
	br i1 %r96, label %L108, label %L109

L108:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L110
L109:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r97 = sub i32 3, 2
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r97)
	br label %L110
L110:
	%r98 = sdiv i32 6, 3
	%r99 = icmp eq i32 %r98, 2
	%r100 = zext i1 %r99 to i32
	%r101 = trunc i32 %r100 to i1
	br i1 %r101, label %L111, label %L112

L111:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L113
L112:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r102 = sdiv i32 6, 3
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r102)
	br label %L113
L113:
	%r103 = sub i32 0, 6
	%r104 = icmp slt i32 %r103, 0
	%r105 = zext i1 %r104 to i32
	%r106 = trunc i32 %r105 to i1
	br i1 %r106, label %L114, label %L115

L114:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L116
L115:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L116
L116:
	call void @printgroup(i32 5 )
	%r107 = icmp eq i32 42, 42
	%r108 = zext i1 %r107 to i32
	%r109 = trunc i32 %r108 to i1
	br i1 %r109, label %L117, label %L118

L117:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L119
L118:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L119
L119:
	%r110 = add i32 3, 2
	%r111 = icmp eq i32 %r110, 5
	%r112 = zext i1 %r111 to i32
	%r113 = trunc i32 %r112 to i1
	br i1 %r113, label %L120, label %L121

L120:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L122
L121:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L122
L122:
	%r114 = zext i1 1 to i32
	%r115 = trunc i32 %r114 to i1
	br i1 %r115, label %L123, label %L124

L123:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L125
L124:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L125
L125:
	%phi13 = phi i32 [%r114, %L123], [%r114, %L124]
	%r116 = xor i32 %phi13, 1
	%r117 = trunc i32 %r116 to i1
	br i1 %r117, label %L126, label %L127

L126:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L128
L127:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L128
L128:
	%r118 = zext i1 0 to i32
	%r119 = trunc i32 %r118 to i1
	br i1 %r119, label %L129, label %L130

L129:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L131
L130:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L131
L131:
	%phi14 = phi i32 [%r118, %L129], [%r118, %L130]
	%r120 = xor i32 %phi14, 1
	%r121 = trunc i32 %r120 to i1
	br i1 %r121, label %L132, label %L133

L132:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L134
L133:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L134
L134:
	%phi15 = phi i32 [%phi14, %L132], [%phi14, %L133]
	%r122 = trunc i32 %phi15 to i1
	br i1 %r122, label %L135, label %L136

L135:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L137
L136:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L137
L137:
	call void @printgroup(i32 6 )
	%r123 = icmp slt i32 0, 5
	%r124 = zext i1 %r123 to i32
	%r125 = trunc i32 %r124 to i1
	br i1 %r125, label %L138, label %L139

L138:
	%phi16 = phi i32 [0, %L137], [%r129, %L142]
	%r126 = icmp sge i32 %phi16, 5
	%r127 = zext i1 %r126 to i32
	%r128 = trunc i32 %r127 to i1
	br i1 %r128, label %L140, label %L141

L140:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L142
L141:
	br label %L142
L142:
	%phi17 = phi i32 [%phi16, %L140], [%phi16, %L141]
	%r129 = add i32 %phi17, 5
	%r130 = icmp slt i32 %r129, 5
	%r131 = zext i1 %r130 to i32
	%r132 = trunc i32 %r131 to i1
	br i1 %r132, label %L138, label %L139

L139:
	%phi18 = phi i32 [0, %L137], [%r129, %L142]
	%r133 = icmp eq i32 %phi18, 5
	%r134 = zext i1 %r133 to i32
	%r135 = trunc i32 %r134 to i1
	br i1 %r135, label %L143, label %L144

L143:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L145
L144:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi18)
	br label %L145
L145:
	call void @printgroup(i32 7 )
	%r136 = call i8* @malloc(i32 24)
	%r137 = bitcast i8* %r136 to %struct.thing*
	%r138 = getelementptr %struct.thing , %struct.thing* %r137, i1 0, i32 1
	store i32 42, i32* %r138
	%r139 = zext i1 1 to i32
	%r140 = getelementptr %struct.thing , %struct.thing* %r137, i1 0, i32 0
	store i32 %r139, i32* %r140
	%r141 = getelementptr %struct.thing , %struct.thing* %r137, i1 0, i32 1
	%r142 = load i32, i32* %r141
	%r143 = icmp eq i32 %r142, 42
	%r144 = zext i1 %r143 to i32
	%r145 = trunc i32 %r144 to i1
	br i1 %r145, label %L146, label %L147

L146:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L148
L147:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r146 = getelementptr %struct.thing , %struct.thing* %r137, i1 0, i32 1
	%r147 = load i32, i32* %r146
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r147)
	br label %L148
L148:
	%phi19 = phi %struct.thing* [%r137, %L146], [%r137, %L147]
	%r148 = getelementptr %struct.thing , %struct.thing* %phi19, i1 0, i32 0
	%r149 = load i32, i32* %r148
	%r150 = trunc i32 %r149 to i1
	br i1 %r150, label %L149, label %L150

L149:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L151
L150:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L151
L151:
	%phi20 = phi %struct.thing* [%phi19, %L149], [%phi19, %L150]
	%r151 = call i8* @malloc(i32 24)
	%r152 = bitcast i8* %r151 to %struct.thing*
	%r153 = getelementptr %struct.thing , %struct.thing* %phi20, i1 0, i32 2
	store %struct.thing* %r152, %struct.thing** %r153
	%r154 = getelementptr %struct.thing , %struct.thing* %phi20, i1 0, i32 2
	%r155 = load %struct.thing*, %struct.thing** %r154
	%r156 = getelementptr %struct.thing , %struct.thing* %r155, i1 0, i32 1
	store i32 13, i32* %r156
	%r157 = zext i1 0 to i32
	%r158 = getelementptr %struct.thing , %struct.thing* %phi20, i1 0, i32 2
	%r159 = load %struct.thing*, %struct.thing** %r158
	%r160 = getelementptr %struct.thing , %struct.thing* %r159, i1 0, i32 0
	store i32 %r157, i32* %r160
	%r161 = getelementptr %struct.thing , %struct.thing* %phi20, i1 0, i32 2
	%r162 = load %struct.thing*, %struct.thing** %r161
	%r163 = getelementptr %struct.thing , %struct.thing* %r162, i1 0, i32 1
	%r164 = load i32, i32* %r163
	%r165 = icmp eq i32 %r164, 13
	%r166 = zext i1 %r165 to i32
	%r167 = trunc i32 %r166 to i1
	br i1 %r167, label %L152, label %L153

L152:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L154
L153:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r168 = getelementptr %struct.thing , %struct.thing* %phi20, i1 0, i32 2
	%r169 = load %struct.thing*, %struct.thing** %r168
	%r170 = getelementptr %struct.thing , %struct.thing* %r169, i1 0, i32 1
	%r171 = load i32, i32* %r170
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r171)
	br label %L154
L154:
	%phi21 = phi %struct.thing* [%phi20, %L152], [%phi20, %L153]
	%r172 = getelementptr %struct.thing , %struct.thing* %phi21, i1 0, i32 2
	%r173 = load %struct.thing*, %struct.thing** %r172
	%r174 = getelementptr %struct.thing , %struct.thing* %r173, i1 0, i32 0
	%r175 = load i32, i32* %r174
	%r176 = xor i32 %r175, 1
	%r177 = trunc i32 %r176 to i1
	br i1 %r177, label %L155, label %L156

L155:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L157
L156:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L157
L157:
	%phi22 = phi %struct.thing* [%phi21, %L155], [%phi21, %L156]
	%r178 = icmp eq %struct.thing* %phi22, %phi22
	%r179 = zext i1 %r178 to i32
	%r180 = trunc i32 %r179 to i1
	br i1 %r180, label %L158, label %L159

L158:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L160
L159:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L160
L160:
	%phi23 = phi %struct.thing* [%phi22, %L158], [%phi22, %L159]
	%r181 = getelementptr %struct.thing , %struct.thing* %phi23, i1 0, i32 2
	%r182 = load %struct.thing*, %struct.thing** %r181
	%r183 = icmp ne %struct.thing* %phi23, %r182
	%r184 = zext i1 %r183 to i32
	%r185 = trunc i32 %r184 to i1
	br i1 %r185, label %L161, label %L162

L161:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L163
L162:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L163
L163:
	%phi24 = phi %struct.thing* [%phi23, %L161], [%phi23, %L162]
	%r187 = getelementptr %struct.thing , %struct.thing* %phi24, i1 0, i32 2
	%r188 = load %struct.thing*, %struct.thing** %r187
	%r186 = bitcast %struct.thing* %r188 to i8*
	call void @free(i8* %r186 )
	%r189 = bitcast %struct.thing* %phi24 to i8*
	call void @free(i8* %r189 )
	call void @printgroup(i32 8 )
	store i32 7, i32* @gi1
	%r190 = load i32, i32* @gi1
	%r191 = icmp eq i32 %r190, 7
	%r192 = zext i1 %r191 to i32
	%r193 = trunc i32 %r192 to i1
	br i1 %r193, label %L164, label %L165

L164:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L166
L165:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r194 = load i32, i32* @gi1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r194)
	br label %L166
L166:
	%r195 = zext i1 1 to i32
	store i32 %r195, i32* @gb1
	%r196 = load i32, i32* @gb1
	%r197 = trunc i32 %r196 to i1
	br i1 %r197, label %L167, label %L168

L167:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L169
L168:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L169
L169:
	%r198 = call i8* @malloc(i32 24)
	%r199 = bitcast i8* %r198 to %struct.thing*
	store %struct.thing* %r199, %struct.thing** @gs1
	%r200 = load %struct.thing*, %struct.thing** @gs1
	%r201 = getelementptr %struct.thing , %struct.thing* %r200, i1 0, i32 1
	store i32 34, i32* %r201
	%r202 = zext i1 0 to i32
	%r203 = load %struct.thing*, %struct.thing** @gs1
	%r204 = getelementptr %struct.thing , %struct.thing* %r203, i1 0, i32 0
	store i32 %r202, i32* %r204
	%r205 = load %struct.thing*, %struct.thing** @gs1
	%r206 = getelementptr %struct.thing , %struct.thing* %r205, i1 0, i32 1
	%r207 = load i32, i32* %r206
	%r208 = icmp eq i32 %r207, 34
	%r209 = zext i1 %r208 to i32
	%r210 = trunc i32 %r209 to i1
	br i1 %r210, label %L170, label %L171

L170:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L172
L171:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r211 = load %struct.thing*, %struct.thing** @gs1
	%r212 = getelementptr %struct.thing , %struct.thing* %r211, i1 0, i32 1
	%r213 = load i32, i32* %r212
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r213)
	br label %L172
L172:
	%r214 = load %struct.thing*, %struct.thing** @gs1
	%r215 = getelementptr %struct.thing , %struct.thing* %r214, i1 0, i32 0
	%r216 = load i32, i32* %r215
	%r217 = xor i32 %r216, 1
	%r218 = trunc i32 %r217 to i1
	br i1 %r218, label %L173, label %L174

L173:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L175
L174:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L175
L175:
	%r219 = call i8* @malloc(i32 24)
	%r220 = bitcast i8* %r219 to %struct.thing*
	%r221 = load %struct.thing*, %struct.thing** @gs1
	%r222 = getelementptr %struct.thing , %struct.thing* %r221, i1 0, i32 2
	store %struct.thing* %r220, %struct.thing** %r222
	%r223 = load %struct.thing*, %struct.thing** @gs1
	%r224 = getelementptr %struct.thing , %struct.thing* %r223, i1 0, i32 2
	%r225 = load %struct.thing*, %struct.thing** %r224
	%r226 = getelementptr %struct.thing , %struct.thing* %r225, i1 0, i32 1
	store i32 16, i32* %r226
	%r227 = zext i1 1 to i32
	%r228 = load %struct.thing*, %struct.thing** @gs1
	%r229 = getelementptr %struct.thing , %struct.thing* %r228, i1 0, i32 2
	%r230 = load %struct.thing*, %struct.thing** %r229
	%r231 = getelementptr %struct.thing , %struct.thing* %r230, i1 0, i32 0
	store i32 %r227, i32* %r231
	%r232 = load %struct.thing*, %struct.thing** @gs1
	%r233 = getelementptr %struct.thing , %struct.thing* %r232, i1 0, i32 2
	%r234 = load %struct.thing*, %struct.thing** %r233
	%r235 = getelementptr %struct.thing , %struct.thing* %r234, i1 0, i32 1
	%r236 = load i32, i32* %r235
	%r237 = icmp eq i32 %r236, 16
	%r238 = zext i1 %r237 to i32
	%r239 = trunc i32 %r238 to i1
	br i1 %r239, label %L176, label %L177

L176:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L178
L177:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r240 = load %struct.thing*, %struct.thing** @gs1
	%r241 = getelementptr %struct.thing , %struct.thing* %r240, i1 0, i32 2
	%r242 = load %struct.thing*, %struct.thing** %r241
	%r243 = getelementptr %struct.thing , %struct.thing* %r242, i1 0, i32 1
	%r244 = load i32, i32* %r243
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r244)
	br label %L178
L178:
	%r245 = load %struct.thing*, %struct.thing** @gs1
	%r246 = getelementptr %struct.thing , %struct.thing* %r245, i1 0, i32 2
	%r247 = load %struct.thing*, %struct.thing** %r246
	%r248 = getelementptr %struct.thing , %struct.thing* %r247, i1 0, i32 0
	%r249 = load i32, i32* %r248
	%r250 = trunc i32 %r249 to i1
	br i1 %r250, label %L179, label %L180

L179:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L181
L180:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L181
L181:
	%r252 = load %struct.thing*, %struct.thing** @gs1
	%r253 = getelementptr %struct.thing , %struct.thing* %r252, i1 0, i32 2
	%r254 = load %struct.thing*, %struct.thing** %r253
	%r251 = bitcast %struct.thing* %r254 to i8*
	call void @free(i8* %r251 )
	%r256 = load %struct.thing*, %struct.thing** @gs1
	%r255 = bitcast %struct.thing* %r256 to i8*
	call void @free(i8* %r255 )
	call void @printgroup(i32 9 )
	%r257 = call i8* @malloc(i32 24)
	%r258 = bitcast i8* %r257 to %struct.thing*
	%r259 = zext i1 1 to i32
	%r260 = getelementptr %struct.thing , %struct.thing* %r258, i1 0, i32 0
	store i32 %r259, i32* %r260
	%r261 = zext i1 1 to i32
	call void @takealltypes(i32 3, i32 %r261, %struct.thing* %r258 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	call void @tonofargs(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r262 = call i32 @returnint(i32 3 )
	%r263 = icmp eq i32 %r262, 3
	%r264 = zext i1 %r263 to i32
	%r265 = trunc i32 %r264 to i1
	br i1 %r265, label %L182, label %L183

L182:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L184
L183:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r262)
	br label %L184
L184:
	%r266 = zext i1 1 to i32
	%r267 = call i32 @returnbool(i32 %r266 )
	%r268 = trunc i32 %r267 to i1
	br i1 %r268, label %L185, label %L186

L185:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L187
L186:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L187
L187:
	%r269 = call i8* @malloc(i32 24)
	%r270 = bitcast i8* %r269 to %struct.thing*
	%r271 = call %struct.thing* @returnstruct(%struct.thing* %r270 )
	%r272 = icmp eq %struct.thing* %r270, %r271
	%r273 = zext i1 %r272 to i32
	%r274 = trunc i32 %r273 to i1
	br i1 %r274, label %L188, label %L189

L188:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L190
L189:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L190
L190:
	call void @printgroup(i32 10 )
	br label %L44
L44:
	%phi25 = phi i32 [0, %L190]
	ret i32 %phi25
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8