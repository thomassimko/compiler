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
	%r5 = phi i32 [%r4, %L1]
	ret i32 %r5
}

define void @deathSort(%struct.Node* %head)
{

L4:
	%r6 = icmp eq i32 1, 1
	%r7 = zext i1 %r6 to i32
	%r8 = trunc i32 %r7 to i1
	br i1 %r8, label %L6, label %L7

L6:
	%r9 = phi %struct.Node* [%head, %L4], [%r48, %L9]
	%r10 = getelementptr %struct.Node , %struct.Node* %r9, i1 0, i32 0
	%r11 = load %struct.Node*, %struct.Node** %r10
	%r12 = icmp ne %struct.Node* %r11, %r9
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L8, label %L9

L8:
	%r15 = phi %struct.Node* [%r9, %L6], [%r34, %L12]
	%r38 = phi %struct.Node* [%r9, %L6], [%r37, %L12]
	%r44 = phi i32 [0, %L6], [%r43, %L12]
	%r16 = getelementptr %struct.Node , %struct.Node* %r15, i1 0, i32 0
	%r17 = load %struct.Node*, %struct.Node** %r16
	%r18 = call i32 @compare(%struct.Node* %r15, %struct.Node* %r17 )
	%r19 = icmp sgt i32 %r18, 0
	%r20 = zext i1 %r19 to i32
	%r21 = trunc i32 %r20 to i1
	br i1 %r21, label %L10, label %L11

L10:
	%r22 = getelementptr %struct.Node , %struct.Node* %r15, i1 0, i32 2
	%r23 = load i32, i32* %r22
	%r24 = getelementptr %struct.Node , %struct.Node* %r15, i1 0, i32 0
	%r25 = load %struct.Node*, %struct.Node** %r24
	%r26 = getelementptr %struct.Node , %struct.Node* %r25, i1 0, i32 2
	%r27 = load i32, i32* %r26
	%r28 = getelementptr %struct.Node , %struct.Node* %r15, i1 0, i32 2
	store i32 %r27, i32* %r28
	%r29 = getelementptr %struct.Node , %struct.Node* %r15, i1 0, i32 0
	%r30 = load %struct.Node*, %struct.Node** %r29
	%r31 = getelementptr %struct.Node , %struct.Node* %r30, i1 0, i32 2
	store i32 %r23, i32* %r31
	br label %L12
L11:
	br label %L12
L12:
	%r32 = phi %struct.Node* [%r15, %L10], [%r15, %L11]
	%r37 = phi %struct.Node* [%r38, %L10], [%r38, %L11]
	%r43 = phi i32 [1, %L10], [%r44, %L11]
	%r33 = getelementptr %struct.Node , %struct.Node* %r32, i1 0, i32 0
	%r34 = load %struct.Node*, %struct.Node** %r33
	%r35 = getelementptr %struct.Node , %struct.Node* %r34, i1 0, i32 0
	%r36 = load %struct.Node*, %struct.Node** %r35
	%r39 = icmp ne %struct.Node* %r36, %r37
	%r40 = zext i1 %r39 to i32
	%r41 = trunc i32 %r40 to i1
	br i1 %r41, label %L8, label %L9

L9:
	%r42 = phi i32 [0, %L6], [%r43, %L12]
	%r48 = phi %struct.Node* [%r9, %L6], [%r37, %L12]
	%r45 = icmp eq i32 %r42, 1
	%r46 = zext i1 %r45 to i32
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L6, label %L7

L7:
	br label %L5
L5:
	ret void
}

define void @printEVILList(%struct.Node* %head)
{

L14:
	%r49 = getelementptr %struct.Node , %struct.Node* %head, i1 0, i32 0
	%r50 = load %struct.Node*, %struct.Node** %r49
	%r51 = getelementptr %struct.Node , %struct.Node* %head, i1 0, i32 2
	%r52 = load i32, i32* %r51
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r52)
	%r53 = bitcast %struct.Node* %head to i8*
	call void @free(i8* %r53 )
	%r54 = icmp ne %struct.Node* %r50, %head
	%r55 = zext i1 %r54 to i32
	%r56 = trunc i32 %r55 to i1
	br i1 %r56, label %L16, label %L17

L16:
	%r57 = phi %struct.Node* [%r50, %L14], [%r61, %L16]
	%r63 = phi %struct.Node* [%head, %L14], [%r63, %L16]
	%r58 = getelementptr %struct.Node , %struct.Node* %r57, i1 0, i32 2
	%r59 = load i32, i32* %r58
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r59)
	%r60 = getelementptr %struct.Node , %struct.Node* %r57, i1 0, i32 0
	%r61 = load %struct.Node*, %struct.Node** %r60
	%r62 = bitcast %struct.Node* %r57 to i8*
	call void @free(i8* %r62 )
	%r64 = icmp ne %struct.Node* %r61, %r63
	%r65 = zext i1 %r64 to i32
	%r66 = trunc i32 %r65 to i1
	br i1 %r66, label %L16, label %L17

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
	%r67 = load i32, i32* @.read_scratch
	%r68 = icmp sle i32 %r67, 0
	%r69 = zext i1 %r68 to i32
	%r70 = trunc i32 %r69 to i1
	br i1 %r70, label %L21, label %L22

L21:
	%r71 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r71)
	%r72 = sub i32 0, 1
	br label %L20
L22:
	br label %L23
L23:
	%r73 = mul i32 %r67, 1000
	%r74 = call i8* @malloc(i32 24)
	%r75 = bitcast i8* %r74 to %struct.Node*
	%r76 = getelementptr %struct.Node , %struct.Node* %r75, i1 0, i32 2
	store i32 %r73, i32* %r76
	%r77 = getelementptr %struct.Node , %struct.Node* %r75, i1 0, i32 1
	store %struct.Node* %r75, %struct.Node** %r77
	%r78 = getelementptr %struct.Node , %struct.Node* %r75, i1 0, i32 0
	store %struct.Node* %r75, %struct.Node** %r78
	%r79 = sub i32 %r73, 1
	%r80 = icmp sgt i32 %r79, 0
	%r81 = zext i1 %r80 to i32
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L24, label %L25

L24:
	%r85 = phi i32 [%r79, %L23], [%r92, %L24]
	%r87 = phi %struct.Node* [%r75, %L23], [%r84, %L24]
	%r89 = phi %struct.Node* [%r75, %L23], [%r89, %L24]
	%r83 = call i8* @malloc(i32 24)
	%r84 = bitcast i8* %r83 to %struct.Node*
	%r86 = getelementptr %struct.Node , %struct.Node* %r84, i1 0, i32 2
	store i32 %r85, i32* %r86
	%r88 = getelementptr %struct.Node , %struct.Node* %r84, i1 0, i32 1
	store %struct.Node* %r87, %struct.Node** %r88
	%r90 = getelementptr %struct.Node , %struct.Node* %r84, i1 0, i32 0
	store %struct.Node* %r89, %struct.Node** %r90
	%r91 = getelementptr %struct.Node , %struct.Node* %r87, i1 0, i32 0
	store %struct.Node* %r84, %struct.Node** %r91
	%r92 = sub i32 %r85, 1
	%r93 = icmp sgt i32 %r92, 0
	%r94 = zext i1 %r93 to i32
	%r95 = trunc i32 %r94 to i1
	br i1 %r95, label %L24, label %L25

L25:
	%r96 = phi %struct.Node* [%r75, %L23], [%r89, %L24]
	call void @deathSort(%struct.Node* %r96 )
	call void @printEVILList(%struct.Node* %r96 )
	br label %L20
L20:
	%r97 = phi i32 [%r72, %L21], [0, %L25]
	ret i32 %r97
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8