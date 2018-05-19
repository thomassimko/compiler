target triple="i686"

%struct.node = type {%struct.node*, i32}

define %struct.node* @buildList()
{

L1:
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.node*
	%r2 = call i8* @malloc(i32 16)
	%r3 = bitcast i8* %r2 to %struct.node*
	%r4 = call i8* @malloc(i32 16)
	%r5 = bitcast i8* %r4 to %struct.node*
	%r6 = call i8* @malloc(i32 16)
	%r7 = bitcast i8* %r6 to %struct.node*
	%r8 = call i8* @malloc(i32 16)
	%r9 = bitcast i8* %r8 to %struct.node*
	%r10 = call i8* @malloc(i32 16)
	%r11 = bitcast i8* %r10 to %struct.node*
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r12 = load i32, i32* @.read_scratch
	%r13 = getelementptr %struct.node , %struct.node* %r1, i1 0, i32 1
	store i32 %r12, i32* %r13
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r14 = load i32, i32* @.read_scratch
	%r15 = getelementptr %struct.node , %struct.node* %r3, i1 0, i32 1
	store i32 %r14, i32* %r15
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r16 = load i32, i32* @.read_scratch
	%r17 = getelementptr %struct.node , %struct.node* %r5, i1 0, i32 1
	store i32 %r16, i32* %r17
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r18 = load i32, i32* @.read_scratch
	%r19 = getelementptr %struct.node , %struct.node* %r7, i1 0, i32 1
	store i32 %r18, i32* %r19
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r20 = load i32, i32* @.read_scratch
	%r21 = getelementptr %struct.node , %struct.node* %r9, i1 0, i32 1
	store i32 %r20, i32* %r21
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r22 = load i32, i32* @.read_scratch
	%r23 = getelementptr %struct.node , %struct.node* %r11, i1 0, i32 1
	store i32 %r22, i32* %r23
	%r24 = getelementptr %struct.node , %struct.node* %r1, i1 0, i32 0
	store %struct.node* %r3, %struct.node** %r24
	%r25 = getelementptr %struct.node , %struct.node* %r3, i1 0, i32 0
	store %struct.node* %r5, %struct.node** %r25
	%r26 = getelementptr %struct.node , %struct.node* %r5, i1 0, i32 0
	store %struct.node* %r7, %struct.node** %r26
	%r27 = getelementptr %struct.node , %struct.node* %r7, i1 0, i32 0
	store %struct.node* %r9, %struct.node** %r27
	%r28 = getelementptr %struct.node , %struct.node* %r9, i1 0, i32 0
	store %struct.node* %r11, %struct.node** %r28
	%r29 = getelementptr %struct.node , %struct.node* %r11, i1 0, i32 0
	store %struct.node* null, %struct.node** %r29
	br label %L2
L2:
	%phi0 = phi %struct.node* [%r1, %L1]
	ret %struct.node* %phi0
}

define i32 @multiple(%struct.node* %list)
{

L4:
	%r30 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r31 = load i32, i32* %r30
	%r32 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r33 = load %struct.node*, %struct.node** %r32
	%r34 = icmp slt i32 0, 5
	%r35 = zext i1 %r34 to i32
	%r36 = trunc i32 %r35 to i1
	br i1 %r36, label %L6, label %L7

L6:
	%phi1 = phi i32 [%r31, %L4], [%r39, %L6]
	%phi2 = phi %struct.node* [%r33, %L4], [%r41, %L6]
	%phi3 = phi i32 [0, %L4], [%r42, %L6]
	%r37 = getelementptr %struct.node , %struct.node* %phi2, i1 0, i32 1
	%r38 = load i32, i32* %r37
	%r39 = mul i32 %phi1, %r38
	%r40 = getelementptr %struct.node , %struct.node* %phi2, i1 0, i32 0
	%r41 = load %struct.node*, %struct.node** %r40
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r39)
	%r42 = add i32 %phi3, 1
	%r43 = icmp slt i32 %r42, 5
	%r44 = zext i1 %r43 to i32
	%r45 = trunc i32 %r44 to i1
	br i1 %r45, label %L6, label %L7

L7:
	%phi4 = phi i32 [%r31, %L4], [%r39, %L6]
	br label %L5
L5:
	%phi5 = phi i32 [%phi4, %L7]
	ret i32 %phi5
}

define i32 @add(%struct.node* %list)
{

L9:
	%r46 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r47 = load i32, i32* %r46
	%r48 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r49 = load %struct.node*, %struct.node** %r48
	%r50 = icmp slt i32 0, 5
	%r51 = zext i1 %r50 to i32
	%r52 = trunc i32 %r51 to i1
	br i1 %r52, label %L11, label %L12

L11:
	%phi6 = phi i32 [%r47, %L9], [%r55, %L11]
	%phi7 = phi %struct.node* [%r49, %L9], [%r57, %L11]
	%phi8 = phi i32 [0, %L9], [%r58, %L11]
	%r53 = getelementptr %struct.node , %struct.node* %phi7, i1 0, i32 1
	%r54 = load i32, i32* %r53
	%r55 = add i32 %phi6, %r54
	%r56 = getelementptr %struct.node , %struct.node* %phi7, i1 0, i32 0
	%r57 = load %struct.node*, %struct.node** %r56
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r55)
	%r58 = add i32 %phi8, 1
	%r59 = icmp slt i32 %r58, 5
	%r60 = zext i1 %r59 to i32
	%r61 = trunc i32 %r60 to i1
	br i1 %r61, label %L11, label %L12

L12:
	%phi9 = phi i32 [%r47, %L9], [%r55, %L11]
	br label %L10
L10:
	%phi10 = phi i32 [%phi9, %L12]
	ret i32 %phi10
}

define i32 @recurseList(%struct.node* %list)
{

L14:
	%r62 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r63 = load %struct.node*, %struct.node** %r62
	%r64 = icmp eq %struct.node* %r63, null
	%r65 = zext i1 %r64 to i32
	%r66 = trunc i32 %r65 to i1
	br i1 %r66, label %L16, label %L17

L16:
	%r67 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r68 = load i32, i32* %r67
	br label %L15
L17:
	%r69 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r70 = load i32, i32* %r69
	%r71 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r72 = load %struct.node*, %struct.node** %r71
	%r73 = call i32 @recurseList(%struct.node* %r72 )
	%r74 = mul i32 %r70, %r73
	br label %L15
L15:
	%phi11 = phi i32 [%r68, %L16], [%r74, %L17]
	ret i32 %phi11
}

define i32 @main()
{

L20:
	%r75 = call %struct.node* @buildList()
	%r76 = call i32 @multiple(%struct.node* %r75 )
	%r77 = call i32 @add(%struct.node* %r75 )
	%r78 = sdiv i32 %r77, 2
	%r79 = sub i32 %r76, %r78
	%r80 = icmp slt i32 0, 2
	%r81 = zext i1 %r80 to i32
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L22, label %L23

L22:
	%phi12 = phi i32 [0, %L20], [%r84, %L22]
	%phi13 = phi %struct.node* [%r75, %L20], [%phi13, %L22]
	%phi14 = phi i32 [0, %L20], [%r85, %L22]
	%phi19 = phi i32 [%r79, %L20], [%phi19, %L22]
	%r83 = call i32 @recurseList(%struct.node* %phi13 )
	%r84 = add i32 %phi12, %r83
	%r85 = add i32 %phi14, 1
	%r86 = icmp slt i32 %r85, 2
	%r87 = zext i1 %r86 to i32
	%r88 = trunc i32 %r87 to i1
	br i1 %r88, label %L22, label %L23

L23:
	%phi15 = phi i32 [0, %L20], [%r84, %L22]
	%phi18 = phi i32 [%r79, %L20], [%phi19, %L22]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi15)
	%r89 = icmp ne i32 %phi15, 0
	%r90 = zext i1 %r89 to i32
	%r91 = trunc i32 %r90 to i1
	br i1 %r91, label %L24, label %L25

L24:
	%phi16 = phi i32 [%phi15, %L23], [%r92, %L24]
	%phi20 = phi i32 [%phi18, %L23], [%phi20, %L24]
	%r92 = sub i32 %phi16, 1
	%r93 = icmp ne i32 %r92, 0
	%r94 = zext i1 %r93 to i32
	%r95 = trunc i32 %r94 to i1
	br i1 %r95, label %L24, label %L25

L25:
	%phi17 = phi i32 [%phi18, %L23], [%phi20, %L24]
	%phi21 = phi i32 [%phi15, %L23], [%r92, %L24]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi17)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi21)
	br label %L21
L21:
	%phi22 = phi i32 [0, %L25]
	ret i32 %phi22
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8