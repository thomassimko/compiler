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
	br label %L5
L5:
	ret i32 1
}

define void @takealltypes(i32 %i, i32 %b, %struct.thing* %s)
{

L7:
	%r2 = icmp eq i32 %i, 3
	%r3 = zext i1 %r2 to i32
	%r4 = trunc i32 %r3 to i1
	br i1 %r4, label %L9, label %L10

L9:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L11
L10:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L11
L11:
	%r5 = phi i32 [%b, %L9], [%b, %L10]
	%r8 = phi %struct.thing* [%s, %L9], [%s, %L10]
	%r6 = trunc i32 %r5 to i1
	br i1 %r6, label %L12, label %L13

L12:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L14
L13:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L14
L14:
	%r7 = phi %struct.thing* [%r8, %L12], [%r8, %L13]
	%r9 = getelementptr %struct.thing , %struct.thing* %r7, i1 0, i32 0
	%r10 = load i32, i32* %r9
	%r11 = trunc i32 %r10 to i1
	br i1 %r11, label %L15, label %L16

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
	%r12 = icmp eq i32 %a5, 5
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L21, label %L22

L21:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L23
L22:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %a5)
	br label %L23
L23:
	%r15 = phi i32 [%a6, %L21], [%a6, %L22]
	%r20 = phi i32 [%a7, %L21], [%a7, %L22]
	%r26 = phi i32 [%a8, %L21], [%a8, %L22]
	%r16 = icmp eq i32 %r15, 6
	%r17 = zext i1 %r16 to i32
	%r18 = trunc i32 %r17 to i1
	br i1 %r18, label %L24, label %L25

L24:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L26
L25:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r15)
	br label %L26
L26:
	%r19 = phi i32 [%r20, %L24], [%r20, %L25]
	%r25 = phi i32 [%r26, %L24], [%r26, %L25]
	%r21 = icmp eq i32 %r19, 7
	%r22 = zext i1 %r21 to i32
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L27, label %L28

L27:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L29
L28:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r19)
	br label %L29
L29:
	%r24 = phi i32 [%r25, %L27], [%r25, %L28]
	%r27 = icmp eq i32 %r24, 8
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L30, label %L31

L30:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L32
L31:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r24)
	br label %L32
L32:
	br label %L20
L20:
	ret void
}

define i32 @main()
{

L43:
	store i32 0, i32* @counter
	call void @printgroup(i32 1 )
	br i1 0, label %L45, label %L46

L45:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L47
L46:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L47
L47:
	br i1 0, label %L48, label %L49

L48:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L50
L49:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L50
L50:
	br i1 0, label %L51, label %L52

L51:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L53
L52:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L53
L53:
	br i1 1, label %L54, label %L55

L54:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L56
L55:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L56
L56:
	store i32 0, i32* @counter
	call void @printgroup(i32 2 )
	br i1 1, label %L57, label %L58

L57:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L59
L58:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L59
L59:
	br i1 1, label %L60, label %L61

L60:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L62
L61:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L62
L62:
	br i1 1, label %L63, label %L64

L63:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L65
L64:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L65
L65:
	br i1 0, label %L66, label %L67

L66:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L68
L67:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L68
L68:
	call void @printgroup(i32 3 )
	br i1 1, label %L69, label %L70

L69:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L71
L70:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L71
L71:
	br i1 1, label %L72, label %L73

L72:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L74
L73:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L74
L74:
	br i1 0, label %L75, label %L76

L75:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L77
L76:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L77
L77:
	br i1 0, label %L78, label %L79

L78:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L80
L79:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L80
L80:
	br i1 0, label %L81, label %L82

L81:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L83
L82:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L83
L83:
	br i1 1, label %L84, label %L85

L84:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L86
L85:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L86
L86:
	br i1 1, label %L87, label %L88

L87:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L89
L88:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L89
L89:
	br i1 0, label %L90, label %L91

L90:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L92
L91:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L92
L92:
	br i1 0, label %L93, label %L94

L93:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L95
L94:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L95
L95:
	br i1 1, label %L96, label %L97

L96:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L98
L97:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L98
L98:
	br i1 1, label %L99, label %L100

L99:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L101
L100:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L101
L101:
	call void @printgroup(i32 4 )
	br i1 1, label %L102, label %L103

L102:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L104
L103:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 5)
	br label %L104
L104:
	br i1 1, label %L105, label %L106

L105:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L107
L106:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 6)
	br label %L107
L107:
	br i1 1, label %L108, label %L109

L108:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L110
L109:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L110
L110:
	br i1 1, label %L111, label %L112

L111:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L113
L112:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	br label %L113
L113:
	br i1 1, label %L114, label %L115

L114:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L116
L115:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L116
L116:
	call void @printgroup(i32 5 )
	br i1 1, label %L117, label %L118

L117:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L119
L118:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L119
L119:
	br i1 1, label %L120, label %L121

L120:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L122
L121:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L122
L122:
	br i1 1, label %L123, label %L124

L123:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L125
L124:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L125
L125:
	br i1 0, label %L126, label %L127

L126:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L128
L127:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L128
L128:
	br i1 0, label %L129, label %L130

L129:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L131
L130:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L131
L131:
	br i1 1, label %L132, label %L133

L132:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L134
L133:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L134
L134:
	br i1 0, label %L135, label %L136

L135:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L137
L136:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L137
L137:
	call void @printgroup(i32 6 )
	br i1 1, label %L138, label %L139

L138:
	%r142 = phi i32 [0, %L137], [%r147, %L142]
	%r143 = icmp sge i32 %r142, 5
	%r144 = zext i1 %r143 to i32
	%r145 = trunc i32 %r144 to i1
	br i1 %r145, label %L140, label %L141

L140:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L142
L141:
	br label %L142
L142:
	%r146 = phi i32 [%r142, %L140], [%r142, %L141]
	%r147 = add i32 %r146, 5
	%r148 = icmp slt i32 %r147, 5
	%r149 = zext i1 %r148 to i32
	%r150 = trunc i32 %r149 to i1
	br i1 %r150, label %L138, label %L139

L139:
	%r151 = phi i32 [0, %L137], [%r147, %L142]
	%r152 = icmp eq i32 %r151, 5
	%r153 = zext i1 %r152 to i32
	%r154 = trunc i32 %r153 to i1
	br i1 %r154, label %L143, label %L144

L143:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L145
L144:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r151)
	br label %L145
L145:
	call void @printgroup(i32 7 )
	%r155 = call i8* @malloc(i32 24)
	%r156 = bitcast i8* %r155 to %struct.thing*
	%r157 = getelementptr %struct.thing , %struct.thing* %r156, i1 0, i32 1
	store i32 42, i32* %r157
	%r158 = zext i1 1 to i32
	%r159 = getelementptr %struct.thing , %struct.thing* %r156, i1 0, i32 0
	store i32 %r158, i32* %r159
	%r160 = getelementptr %struct.thing , %struct.thing* %r156, i1 0, i32 1
	%r161 = load i32, i32* %r160
	%r162 = icmp eq i32 %r161, 42
	%r163 = zext i1 %r162 to i32
	%r164 = trunc i32 %r163 to i1
	br i1 %r164, label %L146, label %L147

L146:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L148
L147:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r165 = getelementptr %struct.thing , %struct.thing* %r156, i1 0, i32 1
	%r166 = load i32, i32* %r165
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r166)
	br label %L148
L148:
	%r167 = phi %struct.thing* [%r156, %L146], [%r156, %L147]
	%r168 = getelementptr %struct.thing , %struct.thing* %r167, i1 0, i32 0
	%r169 = load i32, i32* %r168
	%r170 = trunc i32 %r169 to i1
	br i1 %r170, label %L149, label %L150

L149:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L151
L150:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L151
L151:
	%r173 = phi %struct.thing* [%r167, %L149], [%r167, %L150]
	%r171 = call i8* @malloc(i32 24)
	%r172 = bitcast i8* %r171 to %struct.thing*
	%r174 = getelementptr %struct.thing , %struct.thing* %r173, i1 0, i32 2
	store %struct.thing* %r172, %struct.thing** %r174
	%r175 = getelementptr %struct.thing , %struct.thing* %r173, i1 0, i32 2
	%r176 = load %struct.thing*, %struct.thing** %r175
	%r177 = getelementptr %struct.thing , %struct.thing* %r176, i1 0, i32 1
	store i32 13, i32* %r177
	%r178 = zext i1 0 to i32
	%r179 = getelementptr %struct.thing , %struct.thing* %r173, i1 0, i32 2
	%r180 = load %struct.thing*, %struct.thing** %r179
	%r181 = getelementptr %struct.thing , %struct.thing* %r180, i1 0, i32 0
	store i32 %r178, i32* %r181
	%r182 = getelementptr %struct.thing , %struct.thing* %r173, i1 0, i32 2
	%r183 = load %struct.thing*, %struct.thing** %r182
	%r184 = getelementptr %struct.thing , %struct.thing* %r183, i1 0, i32 1
	%r185 = load i32, i32* %r184
	%r186 = icmp eq i32 %r185, 13
	%r187 = zext i1 %r186 to i32
	%r188 = trunc i32 %r187 to i1
	br i1 %r188, label %L152, label %L153

L152:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L154
L153:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r189 = getelementptr %struct.thing , %struct.thing* %r173, i1 0, i32 2
	%r190 = load %struct.thing*, %struct.thing** %r189
	%r191 = getelementptr %struct.thing , %struct.thing* %r190, i1 0, i32 1
	%r192 = load i32, i32* %r191
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r192)
	br label %L154
L154:
	%r193 = phi %struct.thing* [%r173, %L152], [%r173, %L153]
	%r194 = getelementptr %struct.thing , %struct.thing* %r193, i1 0, i32 2
	%r195 = load %struct.thing*, %struct.thing** %r194
	%r196 = getelementptr %struct.thing , %struct.thing* %r195, i1 0, i32 0
	%r197 = load i32, i32* %r196
	%r198 = xor i32 %r197, 1
	%r199 = trunc i32 %r198 to i1
	br i1 %r199, label %L155, label %L156

L155:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L157
L156:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L157
L157:
	%r200 = phi %struct.thing* [%r193, %L155], [%r193, %L156]
	%r201 = icmp eq %struct.thing* %r200, %r200
	%r202 = zext i1 %r201 to i32
	%r203 = trunc i32 %r202 to i1
	br i1 %r203, label %L158, label %L159

L158:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L160
L159:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L160
L160:
	%r204 = phi %struct.thing* [%r200, %L158], [%r200, %L159]
	%r205 = getelementptr %struct.thing , %struct.thing* %r204, i1 0, i32 2
	%r206 = load %struct.thing*, %struct.thing** %r205
	%r207 = icmp ne %struct.thing* %r204, %r206
	%r208 = zext i1 %r207 to i32
	%r209 = trunc i32 %r208 to i1
	br i1 %r209, label %L161, label %L162

L161:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L163
L162:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L163
L163:
	%r211 = phi %struct.thing* [%r204, %L161], [%r204, %L162]
	%r212 = getelementptr %struct.thing , %struct.thing* %r211, i1 0, i32 2
	%r213 = load %struct.thing*, %struct.thing** %r212
	%r210 = bitcast %struct.thing* %r213 to i8*
	call void @free(i8* %r210 )
	%r214 = bitcast %struct.thing* %r211 to i8*
	call void @free(i8* %r214 )
	call void @printgroup(i32 8 )
	store i32 7, i32* @gi1
	%r215 = load i32, i32* @gi1
	%r216 = icmp eq i32 %r215, 7
	%r217 = zext i1 %r216 to i32
	%r218 = trunc i32 %r217 to i1
	br i1 %r218, label %L164, label %L165

L164:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L166
L165:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r219 = load i32, i32* @gi1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r219)
	br label %L166
L166:
	%r220 = zext i1 1 to i32
	store i32 %r220, i32* @gb1
	%r221 = load i32, i32* @gb1
	%r222 = trunc i32 %r221 to i1
	br i1 %r222, label %L167, label %L168

L167:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L169
L168:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L169
L169:
	%r223 = call i8* @malloc(i32 24)
	%r224 = bitcast i8* %r223 to %struct.thing*
	store %struct.thing* %r224, %struct.thing** @gs1
	%r225 = load %struct.thing*, %struct.thing** @gs1
	%r226 = getelementptr %struct.thing , %struct.thing* %r225, i1 0, i32 1
	store i32 34, i32* %r226
	%r227 = zext i1 0 to i32
	%r228 = load %struct.thing*, %struct.thing** @gs1
	%r229 = getelementptr %struct.thing , %struct.thing* %r228, i1 0, i32 0
	store i32 %r227, i32* %r229
	%r230 = load %struct.thing*, %struct.thing** @gs1
	%r231 = getelementptr %struct.thing , %struct.thing* %r230, i1 0, i32 1
	%r232 = load i32, i32* %r231
	%r233 = icmp eq i32 %r232, 34
	%r234 = zext i1 %r233 to i32
	%r235 = trunc i32 %r234 to i1
	br i1 %r235, label %L170, label %L171

L170:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L172
L171:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r236 = load %struct.thing*, %struct.thing** @gs1
	%r237 = getelementptr %struct.thing , %struct.thing* %r236, i1 0, i32 1
	%r238 = load i32, i32* %r237
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r238)
	br label %L172
L172:
	%r239 = load %struct.thing*, %struct.thing** @gs1
	%r240 = getelementptr %struct.thing , %struct.thing* %r239, i1 0, i32 0
	%r241 = load i32, i32* %r240
	%r242 = xor i32 %r241, 1
	%r243 = trunc i32 %r242 to i1
	br i1 %r243, label %L173, label %L174

L173:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L175
L174:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L175
L175:
	%r244 = call i8* @malloc(i32 24)
	%r245 = bitcast i8* %r244 to %struct.thing*
	%r246 = load %struct.thing*, %struct.thing** @gs1
	%r247 = getelementptr %struct.thing , %struct.thing* %r246, i1 0, i32 2
	store %struct.thing* %r245, %struct.thing** %r247
	%r248 = load %struct.thing*, %struct.thing** @gs1
	%r249 = getelementptr %struct.thing , %struct.thing* %r248, i1 0, i32 2
	%r250 = load %struct.thing*, %struct.thing** %r249
	%r251 = getelementptr %struct.thing , %struct.thing* %r250, i1 0, i32 1
	store i32 16, i32* %r251
	%r252 = zext i1 1 to i32
	%r253 = load %struct.thing*, %struct.thing** @gs1
	%r254 = getelementptr %struct.thing , %struct.thing* %r253, i1 0, i32 2
	%r255 = load %struct.thing*, %struct.thing** %r254
	%r256 = getelementptr %struct.thing , %struct.thing* %r255, i1 0, i32 0
	store i32 %r252, i32* %r256
	%r257 = load %struct.thing*, %struct.thing** @gs1
	%r258 = getelementptr %struct.thing , %struct.thing* %r257, i1 0, i32 2
	%r259 = load %struct.thing*, %struct.thing** %r258
	%r260 = getelementptr %struct.thing , %struct.thing* %r259, i1 0, i32 1
	%r261 = load i32, i32* %r260
	%r262 = icmp eq i32 %r261, 16
	%r263 = zext i1 %r262 to i32
	%r264 = trunc i32 %r263 to i1
	br i1 %r264, label %L176, label %L177

L176:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L178
L177:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%r265 = load %struct.thing*, %struct.thing** @gs1
	%r266 = getelementptr %struct.thing , %struct.thing* %r265, i1 0, i32 2
	%r267 = load %struct.thing*, %struct.thing** %r266
	%r268 = getelementptr %struct.thing , %struct.thing* %r267, i1 0, i32 1
	%r269 = load i32, i32* %r268
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r269)
	br label %L178
L178:
	%r270 = load %struct.thing*, %struct.thing** @gs1
	%r271 = getelementptr %struct.thing , %struct.thing* %r270, i1 0, i32 2
	%r272 = load %struct.thing*, %struct.thing** %r271
	%r273 = getelementptr %struct.thing , %struct.thing* %r272, i1 0, i32 0
	%r274 = load i32, i32* %r273
	%r275 = trunc i32 %r274 to i1
	br i1 %r275, label %L179, label %L180

L179:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L181
L180:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L181
L181:
	%r277 = load %struct.thing*, %struct.thing** @gs1
	%r278 = getelementptr %struct.thing , %struct.thing* %r277, i1 0, i32 2
	%r279 = load %struct.thing*, %struct.thing** %r278
	%r276 = bitcast %struct.thing* %r279 to i8*
	call void @free(i8* %r276 )
	%r281 = load %struct.thing*, %struct.thing** @gs1
	%r280 = bitcast %struct.thing* %r281 to i8*
	call void @free(i8* %r280 )
	call void @printgroup(i32 9 )
	%r282 = call i8* @malloc(i32 24)
	%r283 = bitcast i8* %r282 to %struct.thing*
	%r284 = zext i1 1 to i32
	%r285 = getelementptr %struct.thing , %struct.thing* %r283, i1 0, i32 0
	store i32 %r284, i32* %r285
	call void @takealltypes(i32 3, i32 1, %struct.thing* %r283 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	call void @tonofargs(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	br i1 1, label %L182, label %L183

L182:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L184
L183:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	br label %L184
L184:
	br i1 1, label %L185, label %L186

L185:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L187
L186:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L187
L187:
	%r294 = call i8* @malloc(i32 24)
	%r295 = bitcast i8* %r294 to %struct.thing*
	%r297 = icmp eq %struct.thing* %r295, %r295
	%r298 = zext i1 %r297 to i32
	%r299 = trunc i32 %r298 to i1
	br i1 %r299, label %L188, label %L189

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
	ret i32 0
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8