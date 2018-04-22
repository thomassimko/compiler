target triple="i686"

%struct.node = type {i32, %struct.node*}
%struct.tnode = type {i32, %struct.tnode*, %struct.tnode*}
%struct.i = type {i32}
%struct.myCopy = type {i32}
@a = common global i32 0, align 8
@b = common global i32 0, align 8
@i = common global %struct.i* null, align 8

define %struct.node* @concatLists(%struct.node* %_P_first, %struct.node* %_P_second)
{

L2:
	%_retval_ = alloca %struct.node*
	%first = alloca %struct.node*
	store %struct.node* %_P_first, %struct.node** %first
	%second = alloca %struct.node*
	store %struct.node* %_P_second, %struct.node** %second
	%temp = alloca %struct.node*
	%r0 = load %struct.node*, %struct.node** %first
	store %struct.node* %r0, %struct.node** %temp
	%r1 = load %struct.node*, %struct.node** %first
	%r2 = icmp eq %struct.node* %r1, null
	%r3 = zext i1 %r2 to i32
	%r4 = trunc i32 %r3 to i1
	br i1 %r4, label %L4, label %L5

L4:
	%r5 = load %struct.node*, %struct.node** %second
	store %struct.node* %r5, %struct.node** %_retval_
	br label %L3
L5:
	br label %L6
L6:
	%r10 = load %struct.node*, %struct.node** %temp
	%r11 = getelementptr %struct.node , %struct.node* %r10, i1 0, i32 1
	%r12 = load %struct.node*, %struct.node** %r11
	%r13 = icmp ne %struct.node* %r12, null
	%r14 = zext i1 %r13 to i32
	%r15 = trunc i32 %r14 to i1
	br i1 %r15, label %L8, label %L9

L8:
	%r7 = load %struct.node*, %struct.node** %temp
	%r8 = getelementptr %struct.node , %struct.node* %r7, i1 0, i32 1
	%r9 = load %struct.node*, %struct.node** %r8
	store %struct.node* %r9, %struct.node** %temp
	%r16 = load %struct.node*, %struct.node** %temp
	%r17 = getelementptr %struct.node , %struct.node* %r16, i1 0, i32 1
	%r18 = load %struct.node*, %struct.node** %r17
	%r19 = icmp ne %struct.node* %r18, null
	%r20 = zext i1 %r19 to i32
	%r21 = trunc i32 %r20 to i1
	br i1 %r21, label %L8, label %L9

L9:
	%r22 = load %struct.node*, %struct.node** %temp
	%r23 = getelementptr %struct.node , %struct.node* %r22, i1 0, i32 1
	%r24 = load %struct.node*, %struct.node** %second
	store %struct.node* %r24, %struct.node** %r23
	%r25 = load %struct.node*, %struct.node** %first
	store %struct.node* %r25, %struct.node** %_retval_
	br label %L3
L3:
	%r6 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r6
}

define %struct.node* @add(%struct.node* %_P_list, i32 %_P_toAdd)
{

L11:
	%_retval_ = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%toAdd = alloca i32
	store i32 %_P_toAdd, i32* %toAdd
	%newNode = alloca %struct.node*
	%r27 = call i8* @malloc(i32 16)
	%r28 = bitcast i8* %r27 to %struct.node*
	store %struct.node* %r28, %struct.node** %newNode
	%r29 = load %struct.node*, %struct.node** %newNode
	%r30 = getelementptr %struct.node , %struct.node* %r29, i1 0, i32 0
	%r31 = load i32, i32* %toAdd
	store i32 %r31, i32* %r30
	%r32 = load %struct.node*, %struct.node** %newNode
	%r33 = getelementptr %struct.node , %struct.node* %r32, i1 0, i32 1
	%r34 = load %struct.node*, %struct.node** %list
	store %struct.node* %r34, %struct.node** %r33
	%r35 = load %struct.node*, %struct.node** %newNode
	store %struct.node* %r35, %struct.node** %_retval_
	br label %L12
L12:
	%r36 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r36
}

define i32 @size(%struct.node* %_P_list)
{

L14:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%r37 = load %struct.node*, %struct.node** %list
	%r38 = icmp eq %struct.node* %r37, null
	%r39 = zext i1 %r38 to i32
	%r40 = trunc i32 %r39 to i1
	br i1 %r40, label %L16, label %L17

L16:
	store i32 0, i32* %_retval_
	br label %L15
L17:
	br label %L18
L18:
	%r42 = load %struct.node*, %struct.node** %list
	%r43 = getelementptr %struct.node , %struct.node* %r42, i1 0, i32 1
	%r44 = load %struct.node*, %struct.node** %r43
	%r45 = call i32 @size(%struct.node* %r44 )
	%r46 = add i32 1, %r45
	store i32 %r46, i32* %_retval_
	br label %L15
L15:
	%r41 = load i32, i32* %_retval_
	ret i32 %r41
}

define i32 @get(%struct.node* %_P_list, i32 %_P_index)
{

L21:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%index = alloca i32
	store i32 %_P_index, i32* %index
	%r48 = load i32, i32* %index
	%r49 = icmp eq i32 %r48, 0
	%r50 = zext i1 %r49 to i32
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L23, label %L24

L23:
	%r52 = load %struct.node*, %struct.node** %list
	%r53 = getelementptr %struct.node , %struct.node* %r52, i1 0, i32 0
	%r54 = load i32, i32* %r53
	store i32 %r54, i32* %_retval_
	br label %L22
L24:
	br label %L25
L25:
	%r56 = load %struct.node*, %struct.node** %list
	%r57 = getelementptr %struct.node , %struct.node* %r56, i1 0, i32 1
	%r58 = load %struct.node*, %struct.node** %r57
	%r59 = load i32, i32* %index
	%r60 = sub i32 %r59, 1
	%r61 = call i32 @get(%struct.node* %r58, i32 %r60 )
	store i32 %r61, i32* %_retval_
	br label %L22
L22:
	%r55 = load i32, i32* %_retval_
	ret i32 %r55
}

define %struct.node* @pop(%struct.node* %_P_list)
{

L28:
	%_retval_ = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%r63 = load %struct.node*, %struct.node** %list
	%r64 = getelementptr %struct.node , %struct.node* %r63, i1 0, i32 1
	%r65 = load %struct.node*, %struct.node** %r64
	store %struct.node* %r65, %struct.node** %list
	%r66 = load %struct.node*, %struct.node** %list
	store %struct.node* %r66, %struct.node** %_retval_
	br label %L29
L29:
	%r67 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r67
}

define void @printList(%struct.node* %_P_list)
{

L31:
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%r68 = load %struct.node*, %struct.node** %list
	%r69 = icmp ne %struct.node* %r68, null
	%r70 = zext i1 %r69 to i32
	%r71 = trunc i32 %r70 to i1
	br i1 %r71, label %L33, label %L34

L33:
	%r72 = load %struct.node*, %struct.node** %list
	%r73 = getelementptr %struct.node , %struct.node* %r72, i1 0, i32 0
	%r74 = load i32, i32* %r73
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r74)
	%r75 = load %struct.node*, %struct.node** %list
	%r76 = getelementptr %struct.node , %struct.node* %r75, i1 0, i32 1
	%r77 = load %struct.node*, %struct.node** %r76
	call void @printList(%struct.node* %r77 )
	br label %L35
L34:
	br label %L35
L35:
	br label %L32
L32:
	ret void
}

define void @treeprint(%struct.tnode* %_P_root)
{

L37:
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%r78 = load %struct.tnode*, %struct.tnode** %root
	%r79 = icmp ne %struct.tnode* %r78, null
	%r80 = zext i1 %r79 to i32
	%r81 = trunc i32 %r80 to i1
	br i1 %r81, label %L39, label %L40

L39:
	%r82 = load %struct.tnode*, %struct.tnode** %root
	%r83 = getelementptr %struct.tnode , %struct.tnode* %r82, i1 0, i32 1
	%r84 = load %struct.tnode*, %struct.tnode** %r83
	call void @treeprint(%struct.tnode* %r84 )
	%r85 = load %struct.tnode*, %struct.tnode** %root
	%r86 = getelementptr %struct.tnode , %struct.tnode* %r85, i1 0, i32 0
	%r87 = load i32, i32* %r86
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r87)
	%r88 = load %struct.tnode*, %struct.tnode** %root
	%r89 = getelementptr %struct.tnode , %struct.tnode* %r88, i1 0, i32 2
	%r90 = load %struct.tnode*, %struct.tnode** %r89
	call void @treeprint(%struct.tnode* %r90 )
	br label %L41
L40:
	br label %L41
L41:
	br label %L38
L38:
	ret void
}

define void @freeList(%struct.node* %_P_list)
{

L43:
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%r91 = load %struct.node*, %struct.node** %list
	%r92 = icmp ne %struct.node* %r91, null
	%r93 = zext i1 %r92 to i32
	%r94 = trunc i32 %r93 to i1
	br i1 %r94, label %L45, label %L46

L45:
	%r95 = load %struct.node*, %struct.node** %list
	%r96 = getelementptr %struct.node , %struct.node* %r95, i1 0, i32 1
	%r97 = load %struct.node*, %struct.node** %r96
	call void @freeList(%struct.node* %r97 )
	%r99 = load %struct.node*, %struct.node** %list
	%r98 = bitcast %struct.node* %r99 to i8*
	call void @free(i8* %r98 )
	br label %L47
L46:
	br label %L47
L47:
	br label %L44
L44:
	ret void
}

define void @freeTree(%struct.tnode* %_P_root)
{

L49:
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%r100 = load %struct.tnode*, %struct.tnode** %root
	%r101 = icmp eq %struct.tnode* %r100, null
	%r102 = zext i1 %r101 to i32
	%r103 = xor i32 %r102, 1
	%r104 = trunc i32 %r103 to i1
	br i1 %r104, label %L51, label %L52

L51:
	%r105 = load %struct.tnode*, %struct.tnode** %root
	%r106 = getelementptr %struct.tnode , %struct.tnode* %r105, i1 0, i32 1
	%r107 = load %struct.tnode*, %struct.tnode** %r106
	call void @freeTree(%struct.tnode* %r107 )
	%r108 = load %struct.tnode*, %struct.tnode** %root
	%r109 = getelementptr %struct.tnode , %struct.tnode* %r108, i1 0, i32 2
	%r110 = load %struct.tnode*, %struct.tnode** %r109
	call void @freeTree(%struct.tnode* %r110 )
	%r112 = load %struct.tnode*, %struct.tnode** %root
	%r111 = bitcast %struct.tnode* %r112 to i8*
	call void @free(i8* %r111 )
	br label %L53
L52:
	br label %L53
L53:
	br label %L50
L50:
	ret void
}

define %struct.node* @postOrder(%struct.tnode* %_P_root)
{

L55:
	%_retval_ = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%temp = alloca %struct.node*
	%r113 = load %struct.tnode*, %struct.tnode** %root
	%r114 = icmp ne %struct.tnode* %r113, null
	%r115 = zext i1 %r114 to i32
	%r116 = trunc i32 %r115 to i1
	br i1 %r116, label %L57, label %L58

L57:
	%r117 = call i8* @malloc(i32 16)
	%r118 = bitcast i8* %r117 to %struct.node*
	store %struct.node* %r118, %struct.node** %temp
	%r119 = load %struct.node*, %struct.node** %temp
	%r120 = getelementptr %struct.node , %struct.node* %r119, i1 0, i32 0
	%r121 = load %struct.tnode*, %struct.tnode** %root
	%r122 = getelementptr %struct.tnode , %struct.tnode* %r121, i1 0, i32 0
	%r123 = load i32, i32* %r122
	store i32 %r123, i32* %r120
	%r124 = load %struct.node*, %struct.node** %temp
	%r125 = getelementptr %struct.node , %struct.node* %r124, i1 0, i32 1
	store %struct.node* null, %struct.node** %r125
	%r126 = load %struct.tnode*, %struct.tnode** %root
	%r127 = getelementptr %struct.tnode , %struct.tnode* %r126, i1 0, i32 1
	%r128 = load %struct.tnode*, %struct.tnode** %r127
	%r129 = call %struct.node* @postOrder(%struct.tnode* %r128 )
	%r130 = load %struct.tnode*, %struct.tnode** %root
	%r131 = getelementptr %struct.tnode , %struct.tnode* %r130, i1 0, i32 2
	%r132 = load %struct.tnode*, %struct.tnode** %r131
	%r133 = call %struct.node* @postOrder(%struct.tnode* %r132 )
	%r134 = call %struct.node* @concatLists(%struct.node* %r129, %struct.node* %r133 )
	%r135 = load %struct.node*, %struct.node** %temp
	%r136 = call %struct.node* @concatLists(%struct.node* %r134, %struct.node* %r135 )
	store %struct.node* %r136, %struct.node** %_retval_
	br label %L56
L58:
	br label %L59
L59:
	store %struct.node* null, %struct.node** %_retval_
	br label %L56
L56:
	%r137 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r137
}

define %struct.tnode* @treeadd(%struct.tnode* %_P_root, i32 %_P_toAdd)
{

L62:
	%_retval_ = alloca %struct.tnode*
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%toAdd = alloca i32
	store i32 %_P_toAdd, i32* %toAdd
	%temp = alloca %struct.tnode*
	%r139 = load %struct.tnode*, %struct.tnode** %root
	%r140 = icmp eq %struct.tnode* %r139, null
	%r141 = zext i1 %r140 to i32
	%r142 = trunc i32 %r141 to i1
	br i1 %r142, label %L64, label %L65

L64:
	%r143 = call i8* @malloc(i32 24)
	%r144 = bitcast i8* %r143 to %struct.tnode*
	store %struct.tnode* %r144, %struct.tnode** %temp
	%r145 = load %struct.tnode*, %struct.tnode** %temp
	%r146 = getelementptr %struct.tnode , %struct.tnode* %r145, i1 0, i32 0
	%r147 = load i32, i32* %toAdd
	store i32 %r147, i32* %r146
	%r148 = load %struct.tnode*, %struct.tnode** %temp
	%r149 = getelementptr %struct.tnode , %struct.tnode* %r148, i1 0, i32 1
	store %struct.tnode* null, %struct.tnode** %r149
	%r150 = load %struct.tnode*, %struct.tnode** %temp
	%r151 = getelementptr %struct.tnode , %struct.tnode* %r150, i1 0, i32 2
	store %struct.tnode* null, %struct.tnode** %r151
	%r152 = load %struct.tnode*, %struct.tnode** %temp
	store %struct.tnode* %r152, %struct.tnode** %_retval_
	br label %L63
L65:
	br label %L66
L66:
	%r154 = load i32, i32* %toAdd
	%r155 = load %struct.tnode*, %struct.tnode** %root
	%r156 = getelementptr %struct.tnode , %struct.tnode* %r155, i1 0, i32 0
	%r157 = load i32, i32* %r156
	%r158 = icmp slt i32 %r154, %r157
	%r159 = zext i1 %r158 to i32
	%r160 = trunc i32 %r159 to i1
	br i1 %r160, label %L68, label %L69

L68:
	%r161 = load %struct.tnode*, %struct.tnode** %root
	%r162 = getelementptr %struct.tnode , %struct.tnode* %r161, i1 0, i32 1
	%r163 = load %struct.tnode*, %struct.tnode** %root
	%r164 = getelementptr %struct.tnode , %struct.tnode* %r163, i1 0, i32 1
	%r165 = load %struct.tnode*, %struct.tnode** %r164
	%r166 = load i32, i32* %toAdd
	%r167 = call %struct.tnode* @treeadd(%struct.tnode* %r165, i32 %r166 )
	store %struct.tnode* %r167, %struct.tnode** %r162
	br label %L70
L69:
	%r168 = load %struct.tnode*, %struct.tnode** %root
	%r169 = getelementptr %struct.tnode , %struct.tnode* %r168, i1 0, i32 2
	%r170 = load %struct.tnode*, %struct.tnode** %root
	%r171 = getelementptr %struct.tnode , %struct.tnode* %r170, i1 0, i32 2
	%r172 = load %struct.tnode*, %struct.tnode** %r171
	%r173 = load i32, i32* %toAdd
	%r174 = call %struct.tnode* @treeadd(%struct.tnode* %r172, i32 %r173 )
	store %struct.tnode* %r174, %struct.tnode** %r169
	br label %L70
L70:
	%r175 = load %struct.tnode*, %struct.tnode** %root
	store %struct.tnode* %r175, %struct.tnode** %_retval_
	br label %L63
L63:
	%r153 = load %struct.tnode*, %struct.tnode** %_retval_
	ret %struct.tnode* %r153
}

define %struct.node* @quickSort(%struct.node* %_P_list)
{

L72:
	%_retval_ = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%pivot = alloca i32
	%i = alloca i32
	%less = alloca %struct.node*
	%greater = alloca %struct.node*
	%temp = alloca %struct.node*
	store %struct.node* null, %struct.node** %less
	store %struct.node* null, %struct.node** %greater
	%r177 = load %struct.node*, %struct.node** %list
	%r178 = call i32 @size(%struct.node* %r177 )
	%r179 = icmp sle i32 %r178, 1
	%r180 = zext i1 %r179 to i32
	%r181 = trunc i32 %r180 to i1
	br i1 %r181, label %L74, label %L75

L74:
	%r182 = load %struct.node*, %struct.node** %list
	store %struct.node* %r182, %struct.node** %_retval_
	br label %L73
L75:
	br label %L76
L76:
	%r184 = load %struct.node*, %struct.node** %list
	%r185 = call i32 @get(%struct.node* %r184, i32 0 )
	%r186 = load %struct.node*, %struct.node** %list
	%r187 = load %struct.node*, %struct.node** %list
	%r188 = call i32 @size(%struct.node* %r187 )
	%r189 = sub i32 %r188, 1
	%r190 = call i32 @get(%struct.node* %r186, i32 %r189 )
	%r191 = add i32 %r185, %r190
	%r192 = sdiv i32 %r191, 2
	store i32 %r192, i32* %pivot
	%r193 = load %struct.node*, %struct.node** %list
	store %struct.node* %r193, %struct.node** %temp
	store i32 0, i32* %i
	%r216 = load %struct.node*, %struct.node** %temp
	%r217 = icmp ne %struct.node* %r216, null
	%r218 = zext i1 %r217 to i32
	%r219 = trunc i32 %r218 to i1
	br i1 %r219, label %L78, label %L82

L79:
	%r201 = load %struct.node*, %struct.node** %greater
	%r202 = load %struct.node*, %struct.node** %list
	%r203 = load i32, i32* %i
	%r204 = call i32 @get(%struct.node* %r202, i32 %r203 )
	%r205 = call %struct.node* @add(%struct.node* %r201, i32 %r204 )
	store %struct.node* %r205, %struct.node** %greater
	br label %L81
L80:
	%r206 = load %struct.node*, %struct.node** %less
	%r207 = load %struct.node*, %struct.node** %list
	%r208 = load i32, i32* %i
	%r209 = call i32 @get(%struct.node* %r207, i32 %r208 )
	%r210 = call %struct.node* @add(%struct.node* %r206, i32 %r209 )
	store %struct.node* %r210, %struct.node** %less
	br label %L81
L81:
	%r211 = load %struct.node*, %struct.node** %temp
	%r212 = getelementptr %struct.node , %struct.node* %r211, i1 0, i32 1
	%r213 = load %struct.node*, %struct.node** %r212
	store %struct.node* %r213, %struct.node** %temp
	%r214 = load i32, i32* %i
	%r215 = add i32 %r214, 1
	store i32 %r215, i32* %i
	%r220 = load %struct.node*, %struct.node** %temp
	%r221 = icmp ne %struct.node* %r220, null
	%r222 = zext i1 %r221 to i32
	%r223 = trunc i32 %r222 to i1
	br i1 %r223, label %L78, label %L82

L78:
	%r194 = load %struct.node*, %struct.node** %list
	%r195 = load i32, i32* %i
	%r196 = call i32 @get(%struct.node* %r194, i32 %r195 )
	%r197 = load i32, i32* %pivot
	%r198 = icmp sgt i32 %r196, %r197
	%r199 = zext i1 %r198 to i32
	%r200 = trunc i32 %r199 to i1
	br i1 %r200, label %L79, label %L80

L82:
	%r224 = load %struct.node*, %struct.node** %list
	call void @freeList(%struct.node* %r224 )
	%r225 = load %struct.node*, %struct.node** %less
	%r226 = call %struct.node* @quickSort(%struct.node* %r225 )
	%r227 = load %struct.node*, %struct.node** %greater
	%r228 = call %struct.node* @quickSort(%struct.node* %r227 )
	%r229 = call %struct.node* @concatLists(%struct.node* %r226, %struct.node* %r228 )
	store %struct.node* %r229, %struct.node** %_retval_
	br label %L73
L73:
	%r183 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r183
}

define %struct.node* @quickSortMain(%struct.node* %_P_list)
{

L84:
	%_retval_ = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%r231 = load %struct.node*, %struct.node** %list
	call void @printList(%struct.node* %r231 )
	%r232 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r232)
	%r233 = load %struct.node*, %struct.node** %list
	call void @printList(%struct.node* %r233 )
	%r234 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r234)
	%r235 = load %struct.node*, %struct.node** %list
	call void @printList(%struct.node* %r235 )
	%r236 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r236)
	store %struct.node* null, %struct.node** %_retval_
	br label %L85
L85:
	%r237 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r237
}

define i32 @treesearch(%struct.tnode* %_P_root, i32 %_P_target)
{

L87:
	%_retval_ = alloca i32
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%target = alloca i32
	store i32 %_P_target, i32* %target
	%r238 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r238)
	%r239 = load %struct.tnode*, %struct.tnode** %root
	%r240 = icmp ne %struct.tnode* %r239, null
	%r241 = zext i1 %r240 to i32
	%r242 = trunc i32 %r241 to i1
	br i1 %r242, label %L89, label %L90

L89:
	%r243 = load %struct.tnode*, %struct.tnode** %root
	%r244 = getelementptr %struct.tnode , %struct.tnode* %r243, i1 0, i32 0
	%r245 = load i32, i32* %r244
	%r246 = load i32, i32* %target
	%r247 = icmp eq i32 %r245, %r246
	%r248 = zext i1 %r247 to i32
	%r249 = trunc i32 %r248 to i1
	br i1 %r249, label %L92, label %L93

L90:
	br label %L91
L91:
	store i32 0, i32* %_retval_
	br label %L88
L92:
	store i32 1, i32* %_retval_
	br label %L88
L93:
	br label %L94
L94:
	%r251 = load %struct.tnode*, %struct.tnode** %root
	%r252 = getelementptr %struct.tnode , %struct.tnode* %r251, i1 0, i32 1
	%r253 = load %struct.tnode*, %struct.tnode** %r252
	%r254 = load i32, i32* %target
	%r255 = call i32 @treesearch(%struct.tnode* %r253, i32 %r254 )
	%r256 = icmp eq i32 %r255, 1
	%r257 = zext i1 %r256 to i32
	%r258 = trunc i32 %r257 to i1
	br i1 %r258, label %L96, label %L97

L96:
	store i32 1, i32* %_retval_
	br label %L88
L97:
	br label %L98
L98:
	%r260 = load %struct.tnode*, %struct.tnode** %root
	%r261 = getelementptr %struct.tnode , %struct.tnode* %r260, i1 0, i32 2
	%r262 = load %struct.tnode*, %struct.tnode** %r261
	%r263 = load i32, i32* %target
	%r264 = call i32 @treesearch(%struct.tnode* %r262, i32 %r263 )
	%r265 = icmp eq i32 %r264, 1
	%r266 = zext i1 %r265 to i32
	%r267 = trunc i32 %r266 to i1
	br i1 %r267, label %L100, label %L101

L100:
	store i32 1, i32* %_retval_
	br label %L88
L101:
	store i32 0, i32* %_retval_
	br label %L88
L102:
	br label %L91
L88:
	%r250 = load i32, i32* %_retval_
	ret i32 %r250
}

define %struct.node* @inOrder(%struct.tnode* %_P_root)
{

L106:
	%_retval_ = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%temp = alloca %struct.node*
	%r271 = load %struct.tnode*, %struct.tnode** %root
	%r272 = icmp ne %struct.tnode* %r271, null
	%r273 = zext i1 %r272 to i32
	%r274 = trunc i32 %r273 to i1
	br i1 %r274, label %L108, label %L109

L108:
	%r275 = call i8* @malloc(i32 16)
	%r276 = bitcast i8* %r275 to %struct.node*
	store %struct.node* %r276, %struct.node** %temp
	%r277 = load %struct.node*, %struct.node** %temp
	%r278 = getelementptr %struct.node , %struct.node* %r277, i1 0, i32 0
	%r279 = load %struct.tnode*, %struct.tnode** %root
	%r280 = getelementptr %struct.tnode , %struct.tnode* %r279, i1 0, i32 0
	%r281 = load i32, i32* %r280
	store i32 %r281, i32* %r278
	%r282 = load %struct.node*, %struct.node** %temp
	%r283 = getelementptr %struct.node , %struct.node* %r282, i1 0, i32 1
	store %struct.node* null, %struct.node** %r283
	%r284 = load %struct.tnode*, %struct.tnode** %root
	%r285 = getelementptr %struct.tnode , %struct.tnode* %r284, i1 0, i32 1
	%r286 = load %struct.tnode*, %struct.tnode** %r285
	%r287 = call %struct.node* @inOrder(%struct.tnode* %r286 )
	%r288 = load %struct.node*, %struct.node** %temp
	%r289 = load %struct.tnode*, %struct.tnode** %root
	%r290 = getelementptr %struct.tnode , %struct.tnode* %r289, i1 0, i32 2
	%r291 = load %struct.tnode*, %struct.tnode** %r290
	%r292 = call %struct.node* @inOrder(%struct.tnode* %r291 )
	%r293 = call %struct.node* @concatLists(%struct.node* %r288, %struct.node* %r292 )
	%r294 = call %struct.node* @concatLists(%struct.node* %r287, %struct.node* %r293 )
	store %struct.node* %r294, %struct.node** %_retval_
	br label %L107
L109:
	store %struct.node* null, %struct.node** %_retval_
	br label %L107
L110:
	br label %L107
L107:
	%r295 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r295
}

define i32 @bintreesearch(%struct.tnode* %_P_root, i32 %_P_target)
{

L114:
	%_retval_ = alloca i32
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%target = alloca i32
	store i32 %_P_target, i32* %target
	%r297 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r297)
	%r298 = load %struct.tnode*, %struct.tnode** %root
	%r299 = icmp ne %struct.tnode* %r298, null
	%r300 = zext i1 %r299 to i32
	%r301 = trunc i32 %r300 to i1
	br i1 %r301, label %L116, label %L117

L116:
	%r302 = load %struct.tnode*, %struct.tnode** %root
	%r303 = getelementptr %struct.tnode , %struct.tnode* %r302, i1 0, i32 0
	%r304 = load i32, i32* %r303
	%r305 = load i32, i32* %target
	%r306 = icmp eq i32 %r304, %r305
	%r307 = zext i1 %r306 to i32
	%r308 = trunc i32 %r307 to i1
	br i1 %r308, label %L119, label %L120

L117:
	br label %L118
L118:
	store i32 0, i32* %_retval_
	br label %L115
L119:
	store i32 1, i32* %_retval_
	br label %L115
L120:
	br label %L121
L121:
	%r310 = load i32, i32* %target
	%r311 = load %struct.tnode*, %struct.tnode** %root
	%r312 = getelementptr %struct.tnode , %struct.tnode* %r311, i1 0, i32 0
	%r313 = load i32, i32* %r312
	%r314 = icmp slt i32 %r310, %r313
	%r315 = zext i1 %r314 to i32
	%r316 = trunc i32 %r315 to i1
	br i1 %r316, label %L123, label %L124

L123:
	%r317 = load %struct.tnode*, %struct.tnode** %root
	%r318 = getelementptr %struct.tnode , %struct.tnode* %r317, i1 0, i32 1
	%r319 = load %struct.tnode*, %struct.tnode** %r318
	%r320 = load i32, i32* %target
	%r321 = call i32 @bintreesearch(%struct.tnode* %r319, i32 %r320 )
	store i32 %r321, i32* %_retval_
	br label %L115
L124:
	%r323 = load %struct.tnode*, %struct.tnode** %root
	%r324 = getelementptr %struct.tnode , %struct.tnode* %r323, i1 0, i32 2
	%r325 = load %struct.tnode*, %struct.tnode** %r324
	%r326 = load i32, i32* %target
	%r327 = call i32 @bintreesearch(%struct.tnode* %r325, i32 %r326 )
	store i32 %r327, i32* %_retval_
	br label %L115
L125:
	br label %L118
L115:
	%r309 = load i32, i32* %_retval_
	ret i32 %r309
}

define %struct.tnode* @buildTree(%struct.node* %_P_list)
{

L129:
	%_retval_ = alloca %struct.tnode*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%i = alloca i32
	%root = alloca %struct.tnode*
	store %struct.tnode* null, %struct.tnode** %root
	store i32 0, i32* %i
	%r337 = load i32, i32* %i
	%r338 = load %struct.node*, %struct.node** %list
	%r339 = call i32 @size(%struct.node* %r338 )
	%r340 = icmp slt i32 %r337, %r339
	%r341 = zext i1 %r340 to i32
	%r342 = trunc i32 %r341 to i1
	br i1 %r342, label %L131, label %L132

L131:
	%r330 = load %struct.tnode*, %struct.tnode** %root
	%r331 = load %struct.node*, %struct.node** %list
	%r332 = load i32, i32* %i
	%r333 = call i32 @get(%struct.node* %r331, i32 %r332 )
	%r334 = call %struct.tnode* @treeadd(%struct.tnode* %r330, i32 %r333 )
	store %struct.tnode* %r334, %struct.tnode** %root
	%r335 = load i32, i32* %i
	%r336 = add i32 %r335, 1
	store i32 %r336, i32* %i
	%r343 = load i32, i32* %i
	%r344 = load %struct.node*, %struct.node** %list
	%r345 = call i32 @size(%struct.node* %r344 )
	%r346 = icmp slt i32 %r343, %r345
	%r347 = zext i1 %r346 to i32
	%r348 = trunc i32 %r347 to i1
	br i1 %r348, label %L131, label %L132

L132:
	%r349 = load %struct.tnode*, %struct.tnode** %root
	store %struct.tnode* %r349, %struct.tnode** %_retval_
	br label %L130
L130:
	%r350 = load %struct.tnode*, %struct.tnode** %_retval_
	ret %struct.tnode* %r350
}

define void @treeMain(%struct.node* %_P_list)
{

L134:
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%root = alloca %struct.tnode*
	%inList = alloca %struct.node*
	%postList = alloca %struct.node*
	%r351 = load %struct.node*, %struct.node** %list
	%r352 = call %struct.tnode* @buildTree(%struct.node* %r351 )
	store %struct.tnode* %r352, %struct.tnode** %root
	%r353 = load %struct.tnode*, %struct.tnode** %root
	call void @treeprint(%struct.tnode* %r353 )
	%r354 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r354)
	%r355 = load %struct.tnode*, %struct.tnode** %root
	%r356 = call %struct.node* @inOrder(%struct.tnode* %r355 )
	store %struct.node* %r356, %struct.node** %inList
	%r357 = load %struct.node*, %struct.node** %inList
	call void @printList(%struct.node* %r357 )
	%r358 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r358)
	%r359 = load %struct.node*, %struct.node** %inList
	call void @freeList(%struct.node* %r359 )
	%r360 = load %struct.tnode*, %struct.tnode** %root
	%r361 = call %struct.node* @postOrder(%struct.tnode* %r360 )
	store %struct.node* %r361, %struct.node** %postList
	%r362 = load %struct.node*, %struct.node** %postList
	call void @printList(%struct.node* %r362 )
	%r363 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r363)
	%r364 = load %struct.node*, %struct.node** %postList
	call void @freeList(%struct.node* %r364 )
	%r365 = load %struct.tnode*, %struct.tnode** %root
	%r366 = call i32 @treesearch(%struct.tnode* %r365, i32 0 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r366)
	%r367 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r367)
	%r368 = load %struct.tnode*, %struct.tnode** %root
	%r369 = call i32 @treesearch(%struct.tnode* %r368, i32 10 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r369)
	%r370 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r370)
	%r371 = load %struct.tnode*, %struct.tnode** %root
	%r372 = sub i32 0, 2
	%r373 = call i32 @treesearch(%struct.tnode* %r371, i32 %r372 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r373)
	%r374 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r374)
	%r375 = load %struct.tnode*, %struct.tnode** %root
	%r376 = call i32 @treesearch(%struct.tnode* %r375, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r376)
	%r377 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r377)
	%r378 = load %struct.tnode*, %struct.tnode** %root
	%r379 = call i32 @treesearch(%struct.tnode* %r378, i32 3 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r379)
	%r380 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r380)
	%r381 = load %struct.tnode*, %struct.tnode** %root
	%r382 = call i32 @treesearch(%struct.tnode* %r381, i32 9 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r382)
	%r383 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r383)
	%r384 = load %struct.tnode*, %struct.tnode** %root
	%r385 = call i32 @treesearch(%struct.tnode* %r384, i32 1 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r385)
	%r386 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r386)
	%r387 = load %struct.tnode*, %struct.tnode** %root
	%r388 = call i32 @bintreesearch(%struct.tnode* %r387, i32 0 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r388)
	%r389 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r389)
	%r390 = load %struct.tnode*, %struct.tnode** %root
	%r391 = call i32 @bintreesearch(%struct.tnode* %r390, i32 10 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r391)
	%r392 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r392)
	%r393 = load %struct.tnode*, %struct.tnode** %root
	%r394 = sub i32 0, 2
	%r395 = call i32 @bintreesearch(%struct.tnode* %r393, i32 %r394 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r395)
	%r396 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r396)
	%r397 = load %struct.tnode*, %struct.tnode** %root
	%r398 = call i32 @bintreesearch(%struct.tnode* %r397, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r398)
	%r399 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r399)
	%r400 = load %struct.tnode*, %struct.tnode** %root
	%r401 = call i32 @bintreesearch(%struct.tnode* %r400, i32 3 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r401)
	%r402 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r402)
	%r403 = load %struct.tnode*, %struct.tnode** %root
	%r404 = call i32 @bintreesearch(%struct.tnode* %r403, i32 9 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r404)
	%r405 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r405)
	%r406 = load %struct.tnode*, %struct.tnode** %root
	%r407 = call i32 @bintreesearch(%struct.tnode* %r406, i32 1 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r407)
	%r408 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r408)
	%r409 = load %struct.tnode*, %struct.tnode** %root
	call void @freeTree(%struct.tnode* %r409 )
	br label %L135
L135:
	ret void
}

define %struct.node* @myCopy(%struct.node* %_P_src)
{

L137:
	%_retval_ = alloca %struct.node*
	%src = alloca %struct.node*
	store %struct.node* %_P_src, %struct.node** %src
	%r410 = load %struct.node*, %struct.node** %src
	%r411 = icmp eq %struct.node* %r410, null
	%r412 = zext i1 %r411 to i32
	%r413 = trunc i32 %r412 to i1
	br i1 %r413, label %L139, label %L140

L139:
	store %struct.node* null, %struct.node** %_retval_
	br label %L138
L140:
	br label %L141
L141:
	%r415 = load %struct.node*, %struct.node** %src
	%r416 = getelementptr %struct.node , %struct.node* %r415, i1 0, i32 0
	%r417 = load i32, i32* %r416
	%r418 = call %struct.node* @add(%struct.node* null, i32 %r417 )
	%r419 = load %struct.node*, %struct.node** %src
	%r420 = getelementptr %struct.node , %struct.node* %r419, i1 0, i32 1
	%r421 = load %struct.node*, %struct.node** %r420
	%r422 = call %struct.node* @myCopy(%struct.node* %r421 )
	%r423 = call %struct.node* @concatLists(%struct.node* %r418, %struct.node* %r422 )
	store %struct.node* %r423, %struct.node** %_retval_
	br label %L138
L138:
	%r414 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %r414
}

define i32 @main()
{

L144:
	%_retval_ = alloca i32
	%i = alloca i32
	%element = alloca i32
	%myList = alloca %struct.node*
	%copyList1 = alloca %struct.node*
	%copyList2 = alloca %struct.node*
	%sortedList = alloca %struct.node*
	store %struct.node* null, %struct.node** %myList
	store %struct.node* null, %struct.node** %copyList1
	store %struct.node* null, %struct.node** %copyList2
	store i32 0, i32* %i
	%r438 = load i32, i32* %i
	%r439 = icmp slt i32 %r438, 10
	%r440 = zext i1 %r439 to i32
	%r441 = trunc i32 %r440 to i1
	br i1 %r441, label %L146, label %L147

L146:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %element)
	%r425 = load %struct.node*, %struct.node** %myList
	%r426 = load i32, i32* %element
	%r427 = call %struct.node* @add(%struct.node* %r425, i32 %r426 )
	store %struct.node* %r427, %struct.node** %myList
	%r428 = load %struct.node*, %struct.node** %myList
	%r429 = call %struct.node* @myCopy(%struct.node* %r428 )
	store %struct.node* %r429, %struct.node** %copyList1
	%r430 = load %struct.node*, %struct.node** %myList
	%r431 = call %struct.node* @myCopy(%struct.node* %r430 )
	store %struct.node* %r431, %struct.node** %copyList2
	%r432 = load %struct.node*, %struct.node** %copyList1
	%r433 = call %struct.node* @quickSortMain(%struct.node* %r432 )
	store %struct.node* %r433, %struct.node** %sortedList
	%r434 = load %struct.node*, %struct.node** %sortedList
	call void @freeList(%struct.node* %r434 )
	%r435 = load %struct.node*, %struct.node** %copyList2
	call void @treeMain(%struct.node* %r435 )
	%r436 = load i32, i32* %i
	%r437 = add i32 %r436, 1
	store i32 %r437, i32* %i
	%r442 = load i32, i32* %i
	%r443 = icmp slt i32 %r442, 10
	%r444 = zext i1 %r443 to i32
	%r445 = trunc i32 %r444 to i1
	br i1 %r445, label %L146, label %L147

L147:
	%r446 = load %struct.node*, %struct.node** %myList
	call void @freeList(%struct.node* %r446 )
	%r447 = load %struct.node*, %struct.node** %copyList1
	call void @freeList(%struct.node* %r447 )
	%r448 = load %struct.node*, %struct.node** %copyList2
	call void @freeList(%struct.node* %r448 )
	store i32 0, i32* %_retval_
	br label %L145
L145:
	%r449 = load i32, i32* %_retval_
	ret i32 %r449
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8