target triple="i686"

%struct.node = type {%struct.node*, i32}

define %struct.node* @buildList()
{

L1:
	%_retval_ = alloca %struct.node*
	%input = alloca i32
	%i = alloca i32
	%n0 = alloca %struct.node*
	%n1 = alloca %struct.node*
	%n2 = alloca %struct.node*
	%n3 = alloca %struct.node*
	%n4 = alloca %struct.node*
	%n5 = alloca %struct.node*
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.node*
	store %struct.node* %r1, %struct.node** %n0
	%r2 = call i8* @malloc(i32 16)
	%r3 = bitcast i8* %r2 to %struct.node*
	store %struct.node* %r3, %struct.node** %n1
	%r4 = call i8* @malloc(i32 16)
	%r5 = bitcast i8* %r4 to %struct.node*
	store %struct.node* %r5, %struct.node** %n2
	%r6 = call i8* @malloc(i32 16)
	%r7 = bitcast i8* %r6 to %struct.node*
	store %struct.node* %r7, %struct.node** %n3
	%r8 = call i8* @malloc(i32 16)
	%r9 = bitcast i8* %r8 to %struct.node*
	store %struct.node* %r9, %struct.node** %n4
	%r10 = call i8* @malloc(i32 16)
	%r11 = bitcast i8* %r10 to %struct.node*
	store %struct.node* %r11, %struct.node** %n5
	%r12 = load %struct.node*, %struct.node** %n0
	%r13 = getelementptr %struct.node , %struct.node* %r12, i1 0, i32 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %r13)
	%r14 = load %struct.node*, %struct.node** %n1
	%r15 = getelementptr %struct.node , %struct.node* %r14, i1 0, i32 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %r15)
	%r16 = load %struct.node*, %struct.node** %n2
	%r17 = getelementptr %struct.node , %struct.node* %r16, i1 0, i32 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %r17)
	%r18 = load %struct.node*, %struct.node** %n3
	%r19 = getelementptr %struct.node , %struct.node* %r18, i1 0, i32 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %r19)
	%r20 = load %struct.node*, %struct.node** %n4
	%r21 = getelementptr %struct.node , %struct.node* %r20, i1 0, i32 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %r21)
	%r22 = load %struct.node*, %struct.node** %n5
	%r23 = getelementptr %struct.node , %struct.node* %r22, i1 0, i32 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %r23)
	%r24 = load %struct.node*, %struct.node** %n0
	%r25 = getelementptr %struct.node , %struct.node* %r24, i1 0, i32 0
	%r26 = load %struct.node*, %struct.node** %n1
	store %struct.node* %r26, %struct.node** %r25
	%r27 = load %struct.node*, %struct.node** %n1
	%r28 = getelementptr %struct.node , %struct.node* %r27, i1 0, i32 0
	%r29 = load %struct.node*, %struct.node** %n2
	store %struct.node* %r29, %struct.node** %r28
	%r30 = load %struct.node*, %struct.node** %n2
	%r31 = getelementptr %struct.node , %struct.node* %r30, i1 0, i32 0
	%r32 = load %struct.node*, %struct.node** %n3
	store %struct.node* %r32, %struct.node** %r31
	%r33 = load %struct.node*, %struct.node** %n3
	%r34 = getelementptr %struct.node , %struct.node* %r33, i1 0, i32 0
	%r35 = load %struct.node*, %struct.node** %n4
	store %struct.node* %r35, %struct.node** %r34
	%r36 = load %struct.node*, %struct.node** %n4
	%r37 = getelementptr %struct.node , %struct.node* %r36, i1 0, i32 0
	%r38 = load %struct.node*, %struct.node** %n5
	store %struct.node* %r38, %struct.node** %r37
	%r39 = load %struct.node*, %struct.node** %n5
	%r40 = getelementptr %struct.node , %struct.node* %r39, i1 0, i32 0
	store %struct.node* null, %struct.node** %r40
	%r41 = load %struct.node*, %struct.node** %n0
	store %struct.node* %r41, %struct.node** %_retval_
	br label %L2
L2:
	%r42 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r42
}

define i32 @multiple(%struct.node* %_P_list)
{

L4:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%i = alloca i32
	%product = alloca i32
	%cur = alloca %struct.node*
	store i32 0, i32* %i
	%r43 = load %struct.node*, %struct.node** %list
	store %struct.node* %r43, %struct.node** %cur
	%r44 = load %struct.node*, %struct.node** %cur
	%r45 = getelementptr %struct.node , %struct.node* %r44, i1 0, i32 1
	%r46 = load i32, i32* %r45
	store i32 %r46, i32* %product
	%r47 = load %struct.node*, %struct.node** %cur
	%r48 = getelementptr %struct.node , %struct.node* %r47, i1 0, i32 0
	%r49 = load %struct.node*, %struct.node** %r48
	store %struct.node* %r49, %struct.node** %cur
	%r61 = load i32, i32* %i
	%r62 = icmp slt i32 %r61, 5
	%r63 = zext i1 %r62 to i32
	%r64 = trunc i32 %r63 to i1
	br i1 %r64, label %L6, label %L7

L6:
	%r50 = load i32, i32* %product
	%r51 = load %struct.node*, %struct.node** %cur
	%r52 = getelementptr %struct.node , %struct.node* %r51, i1 0, i32 1
	%r53 = load i32, i32* %r52
	%r54 = mul i32 %r50, %r53
	store i32 %r54, i32* %product
	%r55 = load %struct.node*, %struct.node** %cur
	%r56 = getelementptr %struct.node , %struct.node* %r55, i1 0, i32 0
	%r57 = load %struct.node*, %struct.node** %r56
	store %struct.node* %r57, %struct.node** %cur
	%r58 = load i32, i32* %product
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r58)
	%r59 = load i32, i32* %i
	%r60 = add i32 %r59, 1
	store i32 %r60, i32* %i
	%r65 = load i32, i32* %i
	%r66 = icmp slt i32 %r65, 5
	%r67 = zext i1 %r66 to i32
	%r68 = trunc i32 %r67 to i1
	br i1 %r68, label %L6, label %L7

L7:
	%r69 = load i32, i32* %product
	store i32 %r69, i32* %_retval_
	br label %L5
L5:
	%r70 = load i32, i32* %_retval_
	ret i32 %r70
}

define i32 @add(%struct.node* %_P_list)
{

L9:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%i = alloca i32
	%sum = alloca i32
	%cur = alloca %struct.node*
	store i32 0, i32* %i
	%r71 = load %struct.node*, %struct.node** %list
	store %struct.node* %r71, %struct.node** %cur
	%r72 = load %struct.node*, %struct.node** %cur
	%r73 = getelementptr %struct.node , %struct.node* %r72, i1 0, i32 1
	%r74 = load i32, i32* %r73
	store i32 %r74, i32* %sum
	%r75 = load %struct.node*, %struct.node** %cur
	%r76 = getelementptr %struct.node , %struct.node* %r75, i1 0, i32 0
	%r77 = load %struct.node*, %struct.node** %r76
	store %struct.node* %r77, %struct.node** %cur
	%r89 = load i32, i32* %i
	%r90 = icmp slt i32 %r89, 5
	%r91 = zext i1 %r90 to i32
	%r92 = trunc i32 %r91 to i1
	br i1 %r92, label %L11, label %L12

L11:
	%r78 = load i32, i32* %sum
	%r79 = load %struct.node*, %struct.node** %cur
	%r80 = getelementptr %struct.node , %struct.node* %r79, i1 0, i32 1
	%r81 = load i32, i32* %r80
	%r82 = add i32 %r78, %r81
	store i32 %r82, i32* %sum
	%r83 = load %struct.node*, %struct.node** %cur
	%r84 = getelementptr %struct.node , %struct.node* %r83, i1 0, i32 0
	%r85 = load %struct.node*, %struct.node** %r84
	store %struct.node* %r85, %struct.node** %cur
	%r86 = load i32, i32* %sum
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r86)
	%r87 = load i32, i32* %i
	%r88 = add i32 %r87, 1
	store i32 %r88, i32* %i
	%r93 = load i32, i32* %i
	%r94 = icmp slt i32 %r93, 5
	%r95 = zext i1 %r94 to i32
	%r96 = trunc i32 %r95 to i1
	br i1 %r96, label %L11, label %L12

L12:
	%r97 = load i32, i32* %sum
	store i32 %r97, i32* %_retval_
	br label %L10
L10:
	%r98 = load i32, i32* %_retval_
	ret i32 %r98
}

define i32 @recurseList(%struct.node* %_P_list)
{

L14:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%r99 = load %struct.node*, %struct.node** %list
	%r100 = getelementptr %struct.node , %struct.node* %r99, i1 0, i32 0
	%r101 = load %struct.node*, %struct.node** %r100
	%r102 = icmp eq %struct.node* %r101, null
	%r103 = zext i1 %r102 to i32
	%r104 = trunc i32 %r103 to i1
	br i1 %r104, label %L16, label %L17

L16:
	%r105 = load %struct.node*, %struct.node** %list
	%r106 = getelementptr %struct.node , %struct.node* %r105, i1 0, i32 1
	%r107 = load i32, i32* %r106
	store i32 %r107, i32* %_retval_
	br label %L15
L17:
	%r109 = load %struct.node*, %struct.node** %list
	%r110 = getelementptr %struct.node , %struct.node* %r109, i1 0, i32 1
	%r111 = load i32, i32* %r110
	%r112 = load %struct.node*, %struct.node** %list
	%r113 = getelementptr %struct.node , %struct.node* %r112, i1 0, i32 0
	%r114 = load %struct.node*, %struct.node** %r113
	%r115 = call i32 @recurseList(%struct.node* %r114 )
	%r116 = mul i32 %r111, %r115
	store i32 %r116, i32* %_retval_
	br label %L15
L18:
	br label %L15
L15:
	%r108 = load i32, i32* %_retval_
	ret i32 %r108
}

define i32 @main()
{

L22:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	%product = alloca i32
	%sum = alloca i32
	%result = alloca i32
	%bigProduct = alloca i32
	%i = alloca i32
	store i32 0, i32* %i
	store i32 0, i32* %bigProduct
	%r118 = call %struct.node* @buildList()
	store %struct.node* %r118, %struct.node** %list
	%r119 = load %struct.node*, %struct.node** %list
	%r120 = call i32 @multiple(%struct.node* %r119 )
	store i32 %r120, i32* %product
	%r121 = load %struct.node*, %struct.node** %list
	%r122 = call i32 @add(%struct.node* %r121 )
	store i32 %r122, i32* %sum
	%r123 = load i32, i32* %product
	%r124 = load i32, i32* %sum
	%r125 = sdiv i32 %r124, 2
	%r126 = sub i32 %r123, %r125
	store i32 %r126, i32* %result
	%r133 = load i32, i32* %i
	%r134 = icmp slt i32 %r133, 2
	%r135 = zext i1 %r134 to i32
	%r136 = trunc i32 %r135 to i1
	br i1 %r136, label %L24, label %L25

L24:
	%r127 = load i32, i32* %bigProduct
	%r128 = load %struct.node*, %struct.node** %list
	%r129 = call i32 @recurseList(%struct.node* %r128 )
	%r130 = add i32 %r127, %r129
	store i32 %r130, i32* %bigProduct
	%r131 = load i32, i32* %i
	%r132 = add i32 %r131, 1
	store i32 %r132, i32* %i
	%r137 = load i32, i32* %i
	%r138 = icmp slt i32 %r137, 2
	%r139 = zext i1 %r138 to i32
	%r140 = trunc i32 %r139 to i1
	br i1 %r140, label %L24, label %L25

L25:
	%r141 = load i32, i32* %bigProduct
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r141)
	%r144 = load i32, i32* %bigProduct
	%r145 = icmp ne i32 %r144, 0
	%r146 = zext i1 %r145 to i32
	%r147 = trunc i32 %r146 to i1
	br i1 %r147, label %L26, label %L27

L26:
	%r142 = load i32, i32* %bigProduct
	%r143 = sub i32 %r142, 1
	store i32 %r143, i32* %bigProduct
	%r148 = load i32, i32* %bigProduct
	%r149 = icmp ne i32 %r148, 0
	%r150 = zext i1 %r149 to i32
	%r151 = trunc i32 %r150 to i1
	br i1 %r151, label %L26, label %L27

L27:
	%r152 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r152)
	%r153 = load i32, i32* %bigProduct
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r153)
	store i32 0, i32* %_retval_
	br label %L23
L23:
	%r154 = load i32, i32* %_retval_
	ret i32 %r154
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8