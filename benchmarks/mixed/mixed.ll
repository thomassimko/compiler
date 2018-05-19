target triple="i686"

%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}
@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive(i32 %num)
{

L1:
	%r0 = icmp sle i32 %num, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	br label %L5
L5:
	%r3 = sub i32 %num, 1
	call void @tailrecursive(i32 %r3 )
	br label %L2
L2:
	ret void
}

define i32 @add(i32 %x, i32 %y)
{

L7:
	%r4 = add i32 %x, %y
	br label %L8
L8:
	%phi0 = phi i32 [%r4, %L7]
	ret i32 %phi0
}

define void @domath(i32 %num)
{

L10:
	%r5 = call i8* @malloc(i32 24)
	%r6 = bitcast i8* %r5 to %struct.foo*
	%r7 = call i8* @malloc(i32 8)
	%r8 = bitcast i8* %r7 to %struct.simple*
	%r9 = getelementptr %struct.foo , %struct.foo* %r6, i1 0, i32 2
	store %struct.simple* %r8, %struct.simple** %r9
	%r10 = call i8* @malloc(i32 24)
	%r11 = bitcast i8* %r10 to %struct.foo*
	%r12 = call i8* @malloc(i32 8)
	%r13 = bitcast i8* %r12 to %struct.simple*
	%r14 = getelementptr %struct.foo , %struct.foo* %r11, i1 0, i32 2
	store %struct.simple* %r13, %struct.simple** %r14
	%r15 = getelementptr %struct.foo , %struct.foo* %r6, i1 0, i32 0
	store i32 %num, i32* %r15
	%r16 = getelementptr %struct.foo , %struct.foo* %r11, i1 0, i32 0
	store i32 3, i32* %r16
	%r17 = getelementptr %struct.foo , %struct.foo* %r6, i1 0, i32 0
	%r18 = load i32, i32* %r17
	%r19 = getelementptr %struct.foo , %struct.foo* %r6, i1 0, i32 2
	%r20 = load %struct.simple*, %struct.simple** %r19
	%r21 = getelementptr %struct.simple , %struct.simple* %r20, i1 0, i32 0
	store i32 %r18, i32* %r21
	%r22 = getelementptr %struct.foo , %struct.foo* %r11, i1 0, i32 0
	%r23 = load i32, i32* %r22
	%r24 = getelementptr %struct.foo , %struct.foo* %r11, i1 0, i32 2
	%r25 = load %struct.simple*, %struct.simple** %r24
	%r26 = getelementptr %struct.simple , %struct.simple* %r25, i1 0, i32 0
	store i32 %r23, i32* %r26
	%r27 = icmp sgt i32 %num, 0
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L12, label %L13

L12:
	%phi1 = phi %struct.foo* [%r6, %L10], [%phi1, %L12]
	%phi2 = phi %struct.foo* [%r11, %L10], [%phi2, %L12]
	%phi3 = phi i32 [%num, %L10], [%r55, %L12]
	%r30 = getelementptr %struct.foo , %struct.foo* %phi1, i1 0, i32 0
	%r31 = load i32, i32* %r30
	%r32 = getelementptr %struct.foo , %struct.foo* %phi2, i1 0, i32 0
	%r33 = load i32, i32* %r32
	%r34 = mul i32 %r31, %r33
	%r35 = getelementptr %struct.foo , %struct.foo* %phi1, i1 0, i32 2
	%r36 = load %struct.simple*, %struct.simple** %r35
	%r37 = getelementptr %struct.simple , %struct.simple* %r36, i1 0, i32 0
	%r38 = load i32, i32* %r37
	%r39 = mul i32 %r34, %r38
	%r40 = getelementptr %struct.foo , %struct.foo* %phi2, i1 0, i32 0
	%r41 = load i32, i32* %r40
	%r42 = sdiv i32 %r39, %r41
	%r43 = getelementptr %struct.foo , %struct.foo* %phi2, i1 0, i32 2
	%r44 = load %struct.simple*, %struct.simple** %r43
	%r45 = getelementptr %struct.simple , %struct.simple* %r44, i1 0, i32 0
	%r46 = load i32, i32* %r45
	%r47 = getelementptr %struct.foo , %struct.foo* %phi1, i1 0, i32 0
	%r48 = load i32, i32* %r47
	%r49 = call i32 @add(i32 %r46, i32 %r48 )
	%r50 = getelementptr %struct.foo , %struct.foo* %phi2, i1 0, i32 0
	%r51 = load i32, i32* %r50
	%r52 = getelementptr %struct.foo , %struct.foo* %phi1, i1 0, i32 0
	%r53 = load i32, i32* %r52
	%r54 = sub i32 %r51, %r53
	%r55 = sub i32 %phi3, 1
	%r56 = icmp sgt i32 %r55, 0
	%r57 = zext i1 %r56 to i32
	%r58 = trunc i32 %r57 to i1
	br i1 %r58, label %L12, label %L13

L13:
	%phi4 = phi %struct.foo* [%r6, %L10], [%phi1, %L12]
	%phi5 = phi %struct.foo* [%r11, %L10], [%phi2, %L12]
	%r59 = bitcast %struct.foo* %phi4 to i8*
	call void @free(i8* %r59 )
	%r60 = bitcast %struct.foo* %phi5 to i8*
	call void @free(i8* %r60 )
	br label %L11
L11:
	ret void
}

define void @objinstantiation(i32 %num)
{

L15:
	%r61 = icmp sgt i32 %num, 0
	%r62 = zext i1 %r61 to i32
	%r63 = trunc i32 %r62 to i1
	br i1 %r63, label %L17, label %L18

L17:
	%phi6 = phi i32 [%num, %L15], [%r67, %L17]
	%r64 = call i8* @malloc(i32 24)
	%r65 = bitcast i8* %r64 to %struct.foo*
	%r66 = bitcast %struct.foo* %r65 to i8*
	call void @free(i8* %r66 )
	%r67 = sub i32 %phi6, 1
	%r68 = icmp sgt i32 %r67, 0
	%r69 = zext i1 %r68 to i32
	%r70 = trunc i32 %r69 to i1
	br i1 %r70, label %L17, label %L18

L18:
	br label %L16
L16:
	ret void
}

define i32 @ackermann(i32 %m, i32 %n)
{

L20:
	%r71 = icmp eq i32 %m, 0
	%r72 = zext i1 %r71 to i32
	%r73 = trunc i32 %r72 to i1
	br i1 %r73, label %L22, label %L23

L22:
	%r74 = add i32 %n, 1
	br label %L21
L23:
	br label %L24
L24:
	%r75 = icmp eq i32 %n, 0
	%r76 = zext i1 %r75 to i32
	%r77 = trunc i32 %r76 to i1
	br i1 %r77, label %L25, label %L26

L25:
	%r78 = sub i32 %m, 1
	%r79 = call i32 @ackermann(i32 %r78, i32 1 )
	br label %L21
L26:
	%r80 = sub i32 %m, 1
	%r81 = sub i32 %n, 1
	%r82 = call i32 @ackermann(i32 %m, i32 %r81 )
	%r83 = call i32 @ackermann(i32 %r80, i32 %r82 )
	br label %L21
L21:
	%phi7 = phi i32 [%r74, %L22], [%r79, %L25], [%r83, %L26]
	ret i32 %phi7
}

define i32 @main()
{

L29:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r84 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r85 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r86 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r87 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r88 = load i32, i32* @.read_scratch
	call void @tailrecursive(i32 %r84 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r84)
	call void @domath(i32 %r85 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r85)
	call void @objinstantiation(i32 %r86 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r86)
	%r89 = call i32 @ackermann(i32 %r87, i32 %r88 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r89)
	br label %L30
L30:
	%phi8 = phi i32 [0, %L29]
	ret i32 %phi8
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8