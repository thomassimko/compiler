target triple="i686"

%struct.Node = type {%struct.Node*, %struct.Node*, i32}
@swapped = common global i32 0, align 8

define i32 @compare(%struct.Node* %_P_a, %struct.Node* %_P_b)
{

L1:
	%_retval_ = alloca i32
	%a = alloca %struct.Node*
	store %struct.Node* %_P_a, %struct.Node** %a
	%b = alloca %struct.Node*
	store %struct.Node* %_P_b, %struct.Node** %b
	%r0 = load %struct.Node*, %struct.Node** %a
	%r1 = getelementptr %struct.Node , %struct.Node* %r0, i1 0, i32 2
	%r2 = load i32, i32* %r1
	%r3 = load %struct.Node*, %struct.Node** %b
	%r4 = getelementptr %struct.Node , %struct.Node* %r3, i1 0, i32 2
	%r5 = load i32, i32* %r4
	%r6 = sub i32 %r2, %r5
	store i32 %r6, i32* %_retval_
	br label %L2
L2:
	%r7 = load i32, i32* %_retval_
	ret i32 %r7
}

define void @deathSort(%struct.Node* %_P_head)
{

L4:
	%head = alloca %struct.Node*
	store %struct.Node* %_P_head, %struct.Node** %head
	%swapped = alloca i32
	%swap = alloca i32
	%currNode = alloca %struct.Node*
	store i32 1, i32* %swapped
	%r8 = load i32, i32* %swapped
	%r9 = icmp eq i32 %r8, 1
	%r10 = zext i1 %r9 to i32
	%r11 = trunc i32 %r10 to i1
	br i1 %r11, label %L6, label %L7

L6:
	store i32 0, i32* %swapped
	%r12 = load %struct.Node*, %struct.Node** %head
	store %struct.Node* %r12, %struct.Node** %currNode
	%r13 = load %struct.Node*, %struct.Node** %currNode
	%r14 = getelementptr %struct.Node , %struct.Node* %r13, i1 0, i32 0
	%r15 = load %struct.Node*, %struct.Node** %r14
	%r16 = load %struct.Node*, %struct.Node** %head
	%r17 = icmp ne %struct.Node* %r15, %r16
	%r18 = zext i1 %r17 to i32
	%r19 = trunc i32 %r18 to i1
	br i1 %r19, label %L8, label %L9

L8:
	%r20 = load %struct.Node*, %struct.Node** %currNode
	%r21 = load %struct.Node*, %struct.Node** %currNode
	%r22 = getelementptr %struct.Node , %struct.Node* %r21, i1 0, i32 0
	%r23 = load %struct.Node*, %struct.Node** %r22
	%r24 = call i32 @compare(%struct.Node* %r20, %struct.Node* %r23 )
	%r25 = icmp sgt i32 %r24, 0
	%r26 = zext i1 %r25 to i32
	%r27 = trunc i32 %r26 to i1
	br i1 %r27, label %L10, label %L11

L10:
	%r28 = load %struct.Node*, %struct.Node** %currNode
	%r29 = getelementptr %struct.Node , %struct.Node* %r28, i1 0, i32 2
	%r30 = load i32, i32* %r29
	store i32 %r30, i32* %swap
	%r31 = load %struct.Node*, %struct.Node** %currNode
	%r32 = getelementptr %struct.Node , %struct.Node* %r31, i1 0, i32 0
	%r33 = load %struct.Node*, %struct.Node** %r32
	%r34 = getelementptr %struct.Node , %struct.Node* %r33, i1 0, i32 2
	%r35 = load i32, i32* %r34
	%r36 = load %struct.Node*, %struct.Node** %currNode
	%r37 = getelementptr %struct.Node , %struct.Node* %r36, i1 0, i32 2
	store i32 %r35, i32* %r37
	%r38 = load i32, i32* %swap
	%r39 = load %struct.Node*, %struct.Node** %currNode
	%r40 = getelementptr %struct.Node , %struct.Node* %r39, i1 0, i32 0
	%r41 = load %struct.Node*, %struct.Node** %r40
	%r42 = getelementptr %struct.Node , %struct.Node* %r41, i1 0, i32 2
	store i32 %r38, i32* %r42
	store i32 1, i32* %swapped
	br label %L12
L11:
	br label %L12
L12:
	%r43 = load %struct.Node*, %struct.Node** %currNode
	%r44 = getelementptr %struct.Node , %struct.Node* %r43, i1 0, i32 0
	%r45 = load %struct.Node*, %struct.Node** %r44
	store %struct.Node* %r45, %struct.Node** %currNode
	%r46 = load %struct.Node*, %struct.Node** %currNode
	%r47 = getelementptr %struct.Node , %struct.Node* %r46, i1 0, i32 0
	%r48 = load %struct.Node*, %struct.Node** %r47
	%r49 = load %struct.Node*, %struct.Node** %head
	%r50 = icmp ne %struct.Node* %r48, %r49
	%r51 = zext i1 %r50 to i32
	%r52 = trunc i32 %r51 to i1
	br i1 %r52, label %L8, label %L9

L9:
	%r53 = load i32, i32* %swapped
	%r54 = icmp eq i32 %r53, 1
	%r55 = zext i1 %r54 to i32
	%r56 = trunc i32 %r55 to i1
	br i1 %r56, label %L6, label %L7

L7:
	br label %L5
L5:
	ret void
}

define void @printEVILList(%struct.Node* %_P_head)
{

L14:
	%head = alloca %struct.Node*
	store %struct.Node* %_P_head, %struct.Node** %head
	%currNode = alloca %struct.Node*
	%toFree = alloca %struct.Node*
	%r57 = load %struct.Node*, %struct.Node** %head
	%r58 = getelementptr %struct.Node , %struct.Node* %r57, i1 0, i32 0
	%r59 = load %struct.Node*, %struct.Node** %r58
	store %struct.Node* %r59, %struct.Node** %currNode
	%r60 = load %struct.Node*, %struct.Node** %head
	%r61 = getelementptr %struct.Node , %struct.Node* %r60, i1 0, i32 2
	%r62 = load i32, i32* %r61
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r62)
	%r64 = load %struct.Node*, %struct.Node** %head
	%r63 = bitcast %struct.Node* %r64 to i8*
	call void @free(i8* %r63 )
	%r65 = load %struct.Node*, %struct.Node** %currNode
	%r66 = load %struct.Node*, %struct.Node** %head
	%r67 = icmp ne %struct.Node* %r65, %r66
	%r68 = zext i1 %r67 to i32
	%r69 = trunc i32 %r68 to i1
	br i1 %r69, label %L16, label %L17

L16:
	%r70 = load %struct.Node*, %struct.Node** %currNode
	store %struct.Node* %r70, %struct.Node** %toFree
	%r71 = load %struct.Node*, %struct.Node** %currNode
	%r72 = getelementptr %struct.Node , %struct.Node* %r71, i1 0, i32 2
	%r73 = load i32, i32* %r72
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r73)
	%r74 = load %struct.Node*, %struct.Node** %currNode
	%r75 = getelementptr %struct.Node , %struct.Node* %r74, i1 0, i32 0
	%r76 = load %struct.Node*, %struct.Node** %r75
	store %struct.Node* %r76, %struct.Node** %currNode
	%r78 = load %struct.Node*, %struct.Node** %toFree
	%r77 = bitcast %struct.Node* %r78 to i8*
	call void @free(i8* %r77 )
	%r79 = load %struct.Node*, %struct.Node** %currNode
	%r80 = load %struct.Node*, %struct.Node** %head
	%r81 = icmp ne %struct.Node* %r79, %r80
	%r82 = zext i1 %r81 to i32
	%r83 = trunc i32 %r82 to i1
	br i1 %r83, label %L16, label %L17

L17:
	br label %L15
L15:
	ret void
}

define i32 @main()
{

L19:
	%_retval_ = alloca i32
	%numNodes = alloca i32
	%counter = alloca i32
	%currNode = alloca %struct.Node*
	%head = alloca %struct.Node*
	%previous = alloca %struct.Node*
	store i32 666, i32* @swapped
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r84 = load i32, i32* @.read_scratch
	store i32 %r84, i32* %numNodes
	%r85 = load i32, i32* %numNodes
	%r86 = icmp sle i32 %r85, 0
	%r87 = zext i1 %r86 to i32
	%r88 = trunc i32 %r87 to i1
	br i1 %r88, label %L21, label %L22

L21:
	%r89 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r89)
	%r90 = sub i32 0, 1
	store i32 %r90, i32* %_retval_
	br label %L20
L22:
	br label %L23
L23:
	%r92 = load i32, i32* %numNodes
	%r93 = mul i32 %r92, 1000
	store i32 %r93, i32* %numNodes
	%r94 = load i32, i32* %numNodes
	store i32 %r94, i32* %counter
	%r95 = call i8* @malloc(i32 24)
	%r96 = bitcast i8* %r95 to %struct.Node*
	store %struct.Node* %r96, %struct.Node** %head
	%r97 = load i32, i32* %counter
	%r98 = load %struct.Node*, %struct.Node** %head
	%r99 = getelementptr %struct.Node , %struct.Node* %r98, i1 0, i32 2
	store i32 %r97, i32* %r99
	%r100 = load %struct.Node*, %struct.Node** %head
	%r101 = load %struct.Node*, %struct.Node** %head
	%r102 = getelementptr %struct.Node , %struct.Node* %r101, i1 0, i32 1
	store %struct.Node* %r100, %struct.Node** %r102
	%r103 = load %struct.Node*, %struct.Node** %head
	%r104 = load %struct.Node*, %struct.Node** %head
	%r105 = getelementptr %struct.Node , %struct.Node* %r104, i1 0, i32 0
	store %struct.Node* %r103, %struct.Node** %r105
	%r106 = load i32, i32* %counter
	%r107 = sub i32 %r106, 1
	store i32 %r107, i32* %counter
	%r108 = load %struct.Node*, %struct.Node** %head
	store %struct.Node* %r108, %struct.Node** %previous
	%r109 = load i32, i32* %counter
	%r110 = icmp sgt i32 %r109, 0
	%r111 = zext i1 %r110 to i32
	%r112 = trunc i32 %r111 to i1
	br i1 %r112, label %L24, label %L25

L24:
	%r113 = call i8* @malloc(i32 24)
	%r114 = bitcast i8* %r113 to %struct.Node*
	store %struct.Node* %r114, %struct.Node** %currNode
	%r115 = load i32, i32* %counter
	%r116 = load %struct.Node*, %struct.Node** %currNode
	%r117 = getelementptr %struct.Node , %struct.Node* %r116, i1 0, i32 2
	store i32 %r115, i32* %r117
	%r118 = load %struct.Node*, %struct.Node** %previous
	%r119 = load %struct.Node*, %struct.Node** %currNode
	%r120 = getelementptr %struct.Node , %struct.Node* %r119, i1 0, i32 1
	store %struct.Node* %r118, %struct.Node** %r120
	%r121 = load %struct.Node*, %struct.Node** %head
	%r122 = load %struct.Node*, %struct.Node** %currNode
	%r123 = getelementptr %struct.Node , %struct.Node* %r122, i1 0, i32 0
	store %struct.Node* %r121, %struct.Node** %r123
	%r124 = load %struct.Node*, %struct.Node** %currNode
	%r125 = load %struct.Node*, %struct.Node** %previous
	%r126 = getelementptr %struct.Node , %struct.Node* %r125, i1 0, i32 0
	store %struct.Node* %r124, %struct.Node** %r126
	%r127 = load %struct.Node*, %struct.Node** %currNode
	store %struct.Node* %r127, %struct.Node** %previous
	%r128 = load i32, i32* %counter
	%r129 = sub i32 %r128, 1
	store i32 %r129, i32* %counter
	%r130 = load i32, i32* %counter
	%r131 = icmp sgt i32 %r130, 0
	%r132 = zext i1 %r131 to i32
	%r133 = trunc i32 %r132 to i1
	br i1 %r133, label %L24, label %L25

L25:
	%r134 = load %struct.Node*, %struct.Node** %head
	call void @deathSort(%struct.Node* %r134 )
	%r135 = load %struct.Node*, %struct.Node** %head
	call void @printEVILList(%struct.Node* %r135 )
	store i32 0, i32* %_retval_
	br label %L20
L20:
	%r91 = load i32, i32* %_retval_
	ret i32 %r91
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8