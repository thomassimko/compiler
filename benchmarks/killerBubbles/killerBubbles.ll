target triple="i686"

%struct.Node = type {%struct.Node*, %struct.Node*, i32}
@swapped = common global i32 0, align 8

define i32 @compare(%struct.Node* %_P_a, %struct.Node* %_P_b)
{

L2:
	%_retval_ = alloca i32
	%a = alloca %struct.Node*
	store %struct.Node* %_P_a, %struct.Node** %a
	%b = alloca %struct.Node*
	store %struct.Node* %_P_b, %struct.Node** %b
	%r0 = load %struct.Node** %a
	%r1 = getelementptr %struct.Node* %r0, i1 0, i32 2
	%r2 = load i32* %r1
	%r3 = load %struct.Node** %b
	%r4 = getelementptr %struct.Node* %r3, i1 0, i32 2
	%r5 = load i32* %r4
	%r6 = sub i32 %r2, %r5
	store i32 %r6, i32* %_retval_
	br label %L3
L3:
	%r7 = load i32* %_retval_
	ret i32 %r7
}

define void @deathSort(%struct.Node* %_P_head)
{

L5:
	%head = alloca %struct.Node*
	store %struct.Node* %_P_head, %struct.Node** %head
	%swapped = alloca i32
	%swap = alloca i32
	%currNode = alloca %struct.Node*
	store i32 1, i32* %swapped
	%r49 = load i32* %swapped
	%r50 = icmp eq i32 %r49, 1
	%r51 = zext i1 %r50 to i32
	%r52 = trunc i32 %r51 to i1
	br i1 %r52, label %L7, label %L13

L9:
	%r17 = load %struct.Node** %currNode
	%r18 = getelementptr %struct.Node* %r17, i1 0, i32 2
	%r19 = load i32* %r18
	store i32 %r19, i32* %swap
	%r20 = load %struct.Node** %currNode
	%r21 = getelementptr %struct.Node* %r20, i1 0, i32 2
	%r22 = load %struct.Node** %currNode
	%r23 = getelementptr %struct.Node* %r22, i1 0, i32 0
	%r24 = load %struct.Node** %r23
	%r25 = getelementptr %struct.Node* %r24, i1 0, i32 2
	%r26 = load i32* %r25
	store i32 %r26, i32* %r21
	%r27 = load %struct.Node** %currNode
	%r28 = getelementptr %struct.Node* %r27, i1 0, i32 0
	%r29 = load %struct.Node** %r28
	%r30 = getelementptr %struct.Node* %r29, i1 0, i32 2
	%r31 = load i32* %swap
	store i32 %r31, i32* %r30
	store i32 1, i32* %swapped
	br label %L11
L10:
	br label %L11
L11:
	%r32 = load %struct.Node** %currNode
	%r33 = getelementptr %struct.Node* %r32, i1 0, i32 0
	%r34 = load %struct.Node** %r33
	store %struct.Node* %r34, %struct.Node** %currNode
	%r42 = load %struct.Node** %currNode
	%r43 = getelementptr %struct.Node* %r42, i1 0, i32 0
	%r44 = load %struct.Node** %r43
	%r45 = load %struct.Node** %head
	%r46 = icmp ne %struct.Node* %r44, %r45
	%r47 = zext i1 %r46 to i32
	%r48 = trunc i32 %r47 to i1
	br i1 %r48, label %L8, label %L12

L8:
	%r9 = load %struct.Node** %currNode
	%r10 = load %struct.Node** %currNode
	%r11 = getelementptr %struct.Node* %r10, i1 0, i32 0
	%r12 = load %struct.Node** %r11
	%r13 = call i32 @compare(%struct.Node* %r9, %struct.Node* %r12 )
	%r14 = icmp sgt i32 %r13, 0
	%r15 = zext i1 %r14 to i32
	%r16 = trunc i32 %r15 to i1
	br i1 %r16, label %L9, label %L10

L12:
	%r53 = load i32* %swapped
	%r54 = icmp eq i32 %r53, 1
	%r55 = zext i1 %r54 to i32
	%r56 = trunc i32 %r55 to i1
	br i1 %r56, label %L7, label %L13

L7:
	store i32 0, i32* %swapped
	%r8 = load %struct.Node** %head
	store %struct.Node* %r8, %struct.Node** %currNode
	%r35 = load %struct.Node** %currNode
	%r36 = getelementptr %struct.Node* %r35, i1 0, i32 0
	%r37 = load %struct.Node** %r36
	%r38 = load %struct.Node** %head
	%r39 = icmp ne %struct.Node* %r37, %r38
	%r40 = zext i1 %r39 to i32
	%r41 = trunc i32 %r40 to i1
	br i1 %r41, label %L8, label %L12

L13:
	br label %L6
L6:
	ret void
}

define void @printEVILList(%struct.Node* %_P_head)
{

L15:
	%head = alloca %struct.Node*
	store %struct.Node* %_P_head, %struct.Node** %head
	%currNode = alloca %struct.Node*
	%toFree = alloca %struct.Node*
	%r57 = load %struct.Node** %head
	%r58 = getelementptr %struct.Node* %r57, i1 0, i32 0
	%r59 = load %struct.Node** %r58
	store %struct.Node* %r59, %struct.Node** %currNode
	%r60 = load %struct.Node** %head
	%r61 = getelementptr %struct.Node* %r60, i1 0, i32 2
	%r62 = load i32* %r61
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r62)
	%r64 = load %struct.Node** %head
	%r63 = bitcast %struct.Node* %r64 to i8*
	call void @free(i8* %r63 )
	%r74 = load %struct.Node** %currNode
	%r75 = load %struct.Node** %head
	%r76 = icmp ne %struct.Node* %r74, %r75
	%r77 = zext i1 %r76 to i32
	%r78 = trunc i32 %r77 to i1
	br i1 %r78, label %L17, label %L18

L17:
	%r65 = load %struct.Node** %currNode
	store %struct.Node* %r65, %struct.Node** %toFree
	%r66 = load %struct.Node** %currNode
	%r67 = getelementptr %struct.Node* %r66, i1 0, i32 2
	%r68 = load i32* %r67
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r68)
	%r69 = load %struct.Node** %currNode
	%r70 = getelementptr %struct.Node* %r69, i1 0, i32 0
	%r71 = load %struct.Node** %r70
	store %struct.Node* %r71, %struct.Node** %currNode
	%r73 = load %struct.Node** %toFree
	%r72 = bitcast %struct.Node* %r73 to i8*
	call void @free(i8* %r72 )
	%r79 = load %struct.Node** %currNode
	%r80 = load %struct.Node** %head
	%r81 = icmp ne %struct.Node* %r79, %r80
	%r82 = zext i1 %r81 to i32
	%r83 = trunc i32 %r82 to i1
	br i1 %r83, label %L17, label %L18

L18:
	br label %L16
L16:
	ret void
}

define i32 @main()
{

L20:
	%_retval_ = alloca i32
	%numNodes = alloca i32
	%counter = alloca i32
	%currNode = alloca %struct.Node*
	%head = alloca %struct.Node*
	%previous = alloca %struct.Node*
	store i32 666, i32* @swapped
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %numNodes)
	%r84 = load i32* %numNodes
	%r85 = icmp sle i32 %r84, 0
	%r86 = zext i1 %r85 to i32
	%r87 = trunc i32 %r86 to i1
	br i1 %r87, label %L22, label %L23

L22:
	%r88 = sub i32 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r88)
	%r89 = sub i32 0, 1
	store i32 %r89, i32* %_retval_
	br label %L21
L23:
	br label %L24
L24:
	%r91 = load i32* %numNodes
	%r92 = mul i32 %r91, 1000
	store i32 %r92, i32* %numNodes
	%r93 = load i32* %numNodes
	store i32 %r93, i32* %counter
	%r94 = call i8* @malloc(i32 24)
	%r95 = bitcast i8* %r94 to %struct.Node*
	store %struct.Node* %r95, %struct.Node** %head
	%r96 = load %struct.Node** %head
	%r97 = getelementptr %struct.Node* %r96, i1 0, i32 2
	%r98 = load i32* %counter
	store i32 %r98, i32* %r97
	%r99 = load %struct.Node** %head
	%r100 = getelementptr %struct.Node* %r99, i1 0, i32 1
	%r101 = load %struct.Node** %head
	store %struct.Node* %r101, %struct.Node** %r100
	%r102 = load %struct.Node** %head
	%r103 = getelementptr %struct.Node* %r102, i1 0, i32 0
	%r104 = load %struct.Node** %head
	store %struct.Node* %r104, %struct.Node** %r103
	%r105 = load i32* %counter
	%r106 = sub i32 %r105, 1
	store i32 %r106, i32* %counter
	%r107 = load %struct.Node** %head
	store %struct.Node* %r107, %struct.Node** %previous
	%r125 = load i32* %counter
	%r126 = icmp sgt i32 %r125, 0
	%r127 = zext i1 %r126 to i32
	%r128 = trunc i32 %r127 to i1
	br i1 %r128, label %L26, label %L27

L26:
	%r108 = call i8* @malloc(i32 24)
	%r109 = bitcast i8* %r108 to %struct.Node*
	store %struct.Node* %r109, %struct.Node** %currNode
	%r110 = load %struct.Node** %currNode
	%r111 = getelementptr %struct.Node* %r110, i1 0, i32 2
	%r112 = load i32* %counter
	store i32 %r112, i32* %r111
	%r113 = load %struct.Node** %currNode
	%r114 = getelementptr %struct.Node* %r113, i1 0, i32 1
	%r115 = load %struct.Node** %previous
	store %struct.Node* %r115, %struct.Node** %r114
	%r116 = load %struct.Node** %currNode
	%r117 = getelementptr %struct.Node* %r116, i1 0, i32 0
	%r118 = load %struct.Node** %head
	store %struct.Node* %r118, %struct.Node** %r117
	%r119 = load %struct.Node** %previous
	%r120 = getelementptr %struct.Node* %r119, i1 0, i32 0
	%r121 = load %struct.Node** %currNode
	store %struct.Node* %r121, %struct.Node** %r120
	%r122 = load %struct.Node** %currNode
	store %struct.Node* %r122, %struct.Node** %previous
	%r123 = load i32* %counter
	%r124 = sub i32 %r123, 1
	store i32 %r124, i32* %counter
	%r129 = load i32* %counter
	%r130 = icmp sgt i32 %r129, 0
	%r131 = zext i1 %r130 to i32
	%r132 = trunc i32 %r131 to i1
	br i1 %r132, label %L26, label %L27

L27:
	%r133 = load %struct.Node** %head
	call void @deathSort(%struct.Node* %r133 )
	%r134 = load %struct.Node** %head
	call void @printEVILList(%struct.Node* %r134 )
	store i32 0, i32* %_retval_
	br label %L21
L21:
	%r90 = load i32* %_retval_
	ret i32 %r90
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8