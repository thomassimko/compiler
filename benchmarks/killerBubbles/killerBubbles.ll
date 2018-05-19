target triple="i686"

%struct.Node = type {%struct.Node*, %struct.Node*, i32}
@swapped = common global i32 0, align 8

define i32 @compare(%struct.Node* %a, %struct.Node* %b)
{

L1:
	%r0 = getelementptr %struct.Node , %struct.Node* %a, i1 0, i32 2
	%r1 = load i32, i32* %r0
	%r2 = getelementptr %struct.Node , %struct.Node* %b, i1 0, i32 2
	%r3 = load i32, i32* %r2
	%r4 = sub i32 %r1, %r3
	br label %L2
L2:
	%phi0 = phi i32 [%r4, %L1]
	ret i32 %phi0
}

define void @deathSort(%struct.Node* %head)
{

L4:
	%r5 = icmp eq i32 1, 1
	%r6 = zext i1 %r5 to i32
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L6, label %L7

L6:
	%phi1 = phi %struct.Node* [%head, %L4], [%phi9, %L9]
	%r8 = getelementptr %struct.Node , %struct.Node* %phi1, i1 0, i32 0
	%r9 = load %struct.Node*, %struct.Node** %r8
	%r10 = icmp ne %struct.Node* %r9, %phi1
	%r11 = zext i1 %r10 to i32
	%r12 = trunc i32 %r11 to i1
	br i1 %r12, label %L8, label %L9

L8:
	%phi2 = phi %struct.Node* [%phi1, %L6], [%r30, %L12]
	%phi5 = phi %struct.Node* [%phi1, %L6], [%phi4, %L12]
	%phi8 = phi i32 [0, %L6], [%phi7, %L12]
	%r13 = getelementptr %struct.Node , %struct.Node* %phi2, i1 0, i32 0
	%r14 = load %struct.Node*, %struct.Node** %r13
	%r15 = call i32 @compare(%struct.Node* %phi2, %struct.Node* %r14 )
	%r16 = icmp sgt i32 %r15, 0
	%r17 = zext i1 %r16 to i32
	%r18 = trunc i32 %r17 to i1
	br i1 %r18, label %L10, label %L11

L10:
	%r19 = getelementptr %struct.Node , %struct.Node* %phi2, i1 0, i32 2
	%r20 = load i32, i32* %r19
	%r21 = getelementptr %struct.Node , %struct.Node* %phi2, i1 0, i32 0
	%r22 = load %struct.Node*, %struct.Node** %r21
	%r23 = getelementptr %struct.Node , %struct.Node* %r22, i1 0, i32 2
	%r24 = load i32, i32* %r23
	%r25 = getelementptr %struct.Node , %struct.Node* %phi2, i1 0, i32 2
	store i32 %r24, i32* %r25
	%r26 = getelementptr %struct.Node , %struct.Node* %phi2, i1 0, i32 0
	%r27 = load %struct.Node*, %struct.Node** %r26
	%r28 = getelementptr %struct.Node , %struct.Node* %r27, i1 0, i32 2
	store i32 %r20, i32* %r28
	br label %L12
L11:
	br label %L12
L12:
	%phi3 = phi %struct.Node* [%phi2, %L10], [%phi2, %L11]
	%phi4 = phi %struct.Node* [%phi5, %L10], [%phi5, %L11]
	%phi7 = phi i32 [1, %L10], [%phi8, %L11]
	%r29 = getelementptr %struct.Node , %struct.Node* %phi3, i1 0, i32 0
	%r30 = load %struct.Node*, %struct.Node** %r29
	%r31 = getelementptr %struct.Node , %struct.Node* %r30, i1 0, i32 0
	%r32 = load %struct.Node*, %struct.Node** %r31
	%r33 = icmp ne %struct.Node* %r32, %phi4
	%r34 = zext i1 %r33 to i32
	%r35 = trunc i32 %r34 to i1
	br i1 %r35, label %L8, label %L9

L9:
	%phi6 = phi i32 [0, %L6], [%phi7, %L12]
	%phi9 = phi %struct.Node* [%phi1, %L6], [%phi4, %L12]
	%r36 = icmp eq i32 %phi6, 1
	%r37 = zext i1 %r36 to i32
	%r38 = trunc i32 %r37 to i1
	br i1 %r38, label %L6, label %L7

L7:
	br label %L5
L5:
	ret void
}

define void @printEVILList(%struct.Node* %head)
{

L14:
	%r39 = getelementptr %struct.Node , %struct.Node* %head, i1 0, i32 0
	%r40 = load %struct.Node*, %struct.Node** %r39
	%r41 = getelementptr %struct.Node , %struct.Node* %head, i1 0, i32 2
	%r42 = load i32, i32* %r41
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r42)
	%r43 = bitcast %struct.Node* %head to i8*
	call void @free(i8* %r43 )
	%r44 = icmp ne %struct.Node* %r40, %head
	%r45 = zext i1 %r44 to i32
	%r46 = trunc i32 %r45 to i1
	br i1 %r46, label %L16, label %L17

L16:
	%phi10 = phi %struct.Node* [%r40, %L14], [%r50, %L16]
	%phi11 = phi %struct.Node* [%head, %L14], [%phi11, %L16]
	%r47 = getelementptr %struct.Node , %struct.Node* %phi10, i1 0, i32 2
	%r48 = load i32, i32* %r47
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r48)
	%r49 = getelementptr %struct.Node , %struct.Node* %phi10, i1 0, i32 0
	%r50 = load %struct.Node*, %struct.Node** %r49
	%r51 = bitcast %struct.Node* %phi10 to i8*
	call void @free(i8* %r51 )
	%r52 = icmp ne %struct.Node* %r50, %phi11
	%r53 = zext i1 %r52 to i32
	%r54 = trunc i32 %r53 to i1
	br i1 %r54, label %L16, label %L17

L17:
	br label %L15
L15:
	ret void
}

define i32 @main()
{

L19:
	store i32 666, i32* @swapped
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r55 = load i32, i32* @.read_scratch
	%r56 = icmp sle i32 %r55, 0
	%r57 = zext i1 %r56 to i32
	%r58 = trunc i32 %r57 to i1
	br i1 %r58, label %L21, label %L22

L21:
	%r59 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r59)
	%r60 = sub i32 0, 1
	br label %L20
L22:
	br label %L23
L23:
	%r61 = mul i32 %r55, 1000
	%r62 = call i8* @malloc(i32 24)
	%r63 = bitcast i8* %r62 to %struct.Node*
	%r64 = getelementptr %struct.Node , %struct.Node* %r63, i1 0, i32 2
	store i32 %r61, i32* %r64
	%r65 = getelementptr %struct.Node , %struct.Node* %r63, i1 0, i32 1
	store %struct.Node* %r63, %struct.Node** %r65
	%r66 = getelementptr %struct.Node , %struct.Node* %r63, i1 0, i32 0
	store %struct.Node* %r63, %struct.Node** %r66
	%r67 = sub i32 %r61, 1
	%r68 = icmp sgt i32 %r67, 0
	%r69 = zext i1 %r68 to i32
	%r70 = trunc i32 %r69 to i1
	br i1 %r70, label %L24, label %L25

L24:
	%phi12 = phi i32 [%r67, %L23], [%r77, %L24]
	%phi13 = phi %struct.Node* [%r63, %L23], [%r72, %L24]
	%phi14 = phi %struct.Node* [%r63, %L23], [%phi14, %L24]
	%r71 = call i8* @malloc(i32 24)
	%r72 = bitcast i8* %r71 to %struct.Node*
	%r73 = getelementptr %struct.Node , %struct.Node* %r72, i1 0, i32 2
	store i32 %phi12, i32* %r73
	%r74 = getelementptr %struct.Node , %struct.Node* %r72, i1 0, i32 1
	store %struct.Node* %phi13, %struct.Node** %r74
	%r75 = getelementptr %struct.Node , %struct.Node* %r72, i1 0, i32 0
	store %struct.Node* %phi14, %struct.Node** %r75
	%r76 = getelementptr %struct.Node , %struct.Node* %phi13, i1 0, i32 0
	store %struct.Node* %r72, %struct.Node** %r76
	%r77 = sub i32 %phi12, 1
	%r78 = icmp sgt i32 %r77, 0
	%r79 = zext i1 %r78 to i32
	%r80 = trunc i32 %r79 to i1
	br i1 %r80, label %L24, label %L25

L25:
	%phi15 = phi %struct.Node* [%r63, %L23], [%phi14, %L24]
	call void @deathSort(%struct.Node* %phi15 )
	call void @printEVILList(%struct.Node* %phi15 )
	br label %L20
L20:
	%phi16 = phi i32 [%r60, %L21], [0, %L25]
	ret i32 %phi16
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8