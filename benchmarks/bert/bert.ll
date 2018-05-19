target triple="i686"

%struct.node = type {i32, %struct.node*}
%struct.tnode = type {i32, %struct.tnode*, %struct.tnode*}
%struct.i = type {i32}
%struct.myCopy = type {i32}
@a = common global i32 0, align 8
@b = common global i32 0, align 8
@i = common global %struct.i* null, align 8

define %struct.node* @concatLists(%struct.node* %first, %struct.node* %second)
{

L1:
	%r0 = icmp eq %struct.node* %first, null
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	br label %L5
L5:
	%r3 = getelementptr %struct.node , %struct.node* %first, i1 0, i32 1
	%r4 = load %struct.node*, %struct.node** %r3
	%r5 = icmp ne %struct.node* %r4, null
	%r6 = zext i1 %r5 to i32
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L6, label %L7

L6:
	%phi0 = phi %struct.node* [%first, %L5], [%r9, %L6]
	%phi2 = phi %struct.node* [%second, %L5], [%phi2, %L6]
	%phi5 = phi %struct.node* [%first, %L5], [%phi5, %L6]
	%r8 = getelementptr %struct.node , %struct.node* %phi0, i1 0, i32 1
	%r9 = load %struct.node*, %struct.node** %r8
	%r10 = getelementptr %struct.node , %struct.node* %r9, i1 0, i32 1
	%r11 = load %struct.node*, %struct.node** %r10
	%r12 = icmp ne %struct.node* %r11, null
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L6, label %L7

L7:
	%phi1 = phi %struct.node* [%second, %L5], [%phi2, %L6]
	%phi3 = phi %struct.node* [%first, %L5], [%r9, %L6]
	%phi4 = phi %struct.node* [%first, %L5], [%phi5, %L6]
	%r15 = getelementptr %struct.node , %struct.node* %phi3, i1 0, i32 1
	store %struct.node* %phi1, %struct.node** %r15
	br label %L2
L2:
	%phi6 = phi %struct.node* [%second, %L3], [%phi4, %L7]
	ret %struct.node* %phi6
}

define %struct.node* @add(%struct.node* %list, i32 %toAdd)
{

L9:
	%r16 = call i8* @malloc(i32 16)
	%r17 = bitcast i8* %r16 to %struct.node*
	%r18 = getelementptr %struct.node , %struct.node* %r17, i1 0, i32 0
	store i32 %toAdd, i32* %r18
	%r19 = getelementptr %struct.node , %struct.node* %r17, i1 0, i32 1
	store %struct.node* %list, %struct.node** %r19
	br label %L10
L10:
	%phi7 = phi %struct.node* [%r17, %L9]
	ret %struct.node* %phi7
}

define i32 @size(%struct.node* %list)
{

L12:
	%r20 = icmp eq %struct.node* %list, null
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L14, label %L15

L14:
	br label %L13
L15:
	br label %L16
L16:
	%r23 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r24 = load %struct.node*, %struct.node** %r23
	%r25 = call i32 @size(%struct.node* %r24 )
	%r26 = add i32 1, %r25
	br label %L13
L13:
	%phi8 = phi i32 [0, %L14], [%r26, %L16]
	ret i32 %phi8
}

define i32 @get(%struct.node* %list, i32 %index)
{

L18:
	%r27 = icmp eq i32 %index, 0
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L20, label %L21

L20:
	%r30 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r31 = load i32, i32* %r30
	br label %L19
L21:
	br label %L22
L22:
	%r32 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r33 = load %struct.node*, %struct.node** %r32
	%r34 = sub i32 %index, 1
	%r35 = call i32 @get(%struct.node* %r33, i32 %r34 )
	br label %L19
L19:
	%phi9 = phi i32 [%r31, %L20], [%r35, %L22]
	ret i32 %phi9
}

define %struct.node* @pop(%struct.node* %list)
{

L24:
	%r36 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r37 = load %struct.node*, %struct.node** %r36
	br label %L25
L25:
	%phi10 = phi %struct.node* [%r37, %L24]
	ret %struct.node* %phi10
}

define void @printList(%struct.node* %list)
{

L27:
	%r38 = icmp ne %struct.node* %list, null
	%r39 = zext i1 %r38 to i32
	%r40 = trunc i32 %r39 to i1
	br i1 %r40, label %L29, label %L30

L29:
	%r41 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r42 = load i32, i32* %r41
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r42)
	%r43 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r44 = load %struct.node*, %struct.node** %r43
	call void @printList(%struct.node* %r44 )
	br label %L31
L30:
	br label %L31
L31:
	br label %L28
L28:
	ret void
}

define void @treeprint(%struct.tnode* %root)
{

L33:
	%r45 = icmp ne %struct.tnode* %root, null
	%r46 = zext i1 %r45 to i32
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L35, label %L36

L35:
	%r48 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r49 = load %struct.tnode*, %struct.tnode** %r48
	call void @treeprint(%struct.tnode* %r49 )
	%r50 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r51 = load i32, i32* %r50
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r51)
	%r52 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r53 = load %struct.tnode*, %struct.tnode** %r52
	call void @treeprint(%struct.tnode* %r53 )
	br label %L37
L36:
	br label %L37
L37:
	br label %L34
L34:
	ret void
}

define void @freeList(%struct.node* %list)
{

L39:
	%r54 = icmp ne %struct.node* %list, null
	%r55 = zext i1 %r54 to i32
	%r56 = trunc i32 %r55 to i1
	br i1 %r56, label %L41, label %L42

L41:
	%r57 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r58 = load %struct.node*, %struct.node** %r57
	call void @freeList(%struct.node* %r58 )
	%r59 = bitcast %struct.node* %list to i8*
	call void @free(i8* %r59 )
	br label %L43
L42:
	br label %L43
L43:
	br label %L40
L40:
	ret void
}

define void @freeTree(%struct.tnode* %root)
{

L45:
	%r60 = icmp eq %struct.tnode* %root, null
	%r61 = zext i1 %r60 to i32
	%r62 = xor i32 %r61, 1
	%r63 = trunc i32 %r62 to i1
	br i1 %r63, label %L47, label %L48

L47:
	%r64 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r65 = load %struct.tnode*, %struct.tnode** %r64
	call void @freeTree(%struct.tnode* %r65 )
	%r66 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r67 = load %struct.tnode*, %struct.tnode** %r66
	call void @freeTree(%struct.tnode* %r67 )
	%r68 = bitcast %struct.tnode* %root to i8*
	call void @free(i8* %r68 )
	br label %L49
L48:
	br label %L49
L49:
	br label %L46
L46:
	ret void
}

define %struct.node* @postOrder(%struct.tnode* %root)
{

L51:
	%r69 = icmp ne %struct.tnode* %root, null
	%r70 = zext i1 %r69 to i32
	%r71 = trunc i32 %r70 to i1
	br i1 %r71, label %L53, label %L54

L53:
	%r72 = call i8* @malloc(i32 16)
	%r73 = bitcast i8* %r72 to %struct.node*
	%r74 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r75 = load i32, i32* %r74
	%r76 = getelementptr %struct.node , %struct.node* %r73, i1 0, i32 0
	store i32 %r75, i32* %r76
	%r77 = getelementptr %struct.node , %struct.node* %r73, i1 0, i32 1
	store %struct.node* null, %struct.node** %r77
	%r78 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r79 = load %struct.tnode*, %struct.tnode** %r78
	%r80 = call %struct.node* @postOrder(%struct.tnode* %r79 )
	%r81 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r82 = load %struct.tnode*, %struct.tnode** %r81
	%r83 = call %struct.node* @postOrder(%struct.tnode* %r82 )
	%r84 = call %struct.node* @concatLists(%struct.node* %r80, %struct.node* %r83 )
	%r85 = call %struct.node* @concatLists(%struct.node* %r84, %struct.node* %r73 )
	br label %L52
L54:
	br label %L55
L55:
	br label %L52
L52:
	%phi11 = phi %struct.node* [%r85, %L53], [null, %L55]
	ret %struct.node* %phi11
}

define %struct.tnode* @treeadd(%struct.tnode* %root, i32 %toAdd)
{

L57:
	%r86 = icmp eq %struct.tnode* %root, null
	%r87 = zext i1 %r86 to i32
	%r88 = trunc i32 %r87 to i1
	br i1 %r88, label %L59, label %L60

L59:
	%r89 = call i8* @malloc(i32 24)
	%r90 = bitcast i8* %r89 to %struct.tnode*
	%r91 = getelementptr %struct.tnode , %struct.tnode* %r90, i1 0, i32 0
	store i32 %toAdd, i32* %r91
	%r92 = getelementptr %struct.tnode , %struct.tnode* %r90, i1 0, i32 1
	store %struct.tnode* null, %struct.tnode** %r92
	%r93 = getelementptr %struct.tnode , %struct.tnode* %r90, i1 0, i32 2
	store %struct.tnode* null, %struct.tnode** %r93
	br label %L58
L60:
	br label %L61
L61:
	%r94 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r95 = load i32, i32* %r94
	%r96 = icmp slt i32 %toAdd, %r95
	%r97 = zext i1 %r96 to i32
	%r98 = trunc i32 %r97 to i1
	br i1 %r98, label %L62, label %L63

L62:
	%r99 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r100 = load %struct.tnode*, %struct.tnode** %r99
	%r101 = call %struct.tnode* @treeadd(%struct.tnode* %r100, i32 %toAdd )
	%r102 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	store %struct.tnode* %r101, %struct.tnode** %r102
	br label %L64
L63:
	%r103 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r104 = load %struct.tnode*, %struct.tnode** %r103
	%r105 = call %struct.tnode* @treeadd(%struct.tnode* %r104, i32 %toAdd )
	%r106 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	store %struct.tnode* %r105, %struct.tnode** %r106
	br label %L64
L64:
	%phi12 = phi %struct.tnode* [%root, %L62], [%root, %L63]
	br label %L58
L58:
	%phi13 = phi %struct.tnode* [%r90, %L59], [%phi12, %L64]
	ret %struct.tnode* %phi13
}

define %struct.node* @quickSort(%struct.node* %list)
{

L66:
	%r107 = call i32 @size(%struct.node* %list )
	%r108 = icmp sle i32 %r107, 1
	%r109 = zext i1 %r108 to i32
	%r110 = trunc i32 %r109 to i1
	br i1 %r110, label %L68, label %L69

L68:
	br label %L67
L69:
	br label %L70
L70:
	%r111 = call i32 @get(%struct.node* %list, i32 0 )
	%r112 = call i32 @size(%struct.node* %list )
	%r113 = sub i32 %r112, 1
	%r114 = call i32 @get(%struct.node* %list, i32 %r113 )
	%r115 = add i32 %r111, %r114
	%r116 = sdiv i32 %r115, 2
	%r117 = icmp ne %struct.node* %list, null
	%r118 = zext i1 %r117 to i32
	%r119 = trunc i32 %r118 to i1
	br i1 %r119, label %L71, label %L72

L71:
	%phi14 = phi %struct.node* [%list, %L70], [%phi22, %L75]
	%phi15 = phi i32 [0, %L70], [%r130, %L75]
	%phi16 = phi i32 [%r116, %L70], [%phi23, %L75]
	%phi17 = phi %struct.node* [null, %L70], [%phi24, %L75]
	%phi18 = phi %struct.node* [null, %L70], [%phi25, %L75]
	%phi20 = phi %struct.node* [%list, %L70], [%r129, %L75]
	%r120 = call i32 @get(%struct.node* %phi14, i32 %phi15 )
	%r121 = icmp sgt i32 %r120, %phi16
	%r122 = zext i1 %r121 to i32
	%r123 = trunc i32 %r122 to i1
	br i1 %r123, label %L73, label %L74

L73:
	%r124 = call i32 @get(%struct.node* %phi14, i32 %phi15 )
	%r125 = call %struct.node* @add(%struct.node* %phi17, i32 %r124 )
	br label %L75
L74:
	%r126 = call i32 @get(%struct.node* %phi14, i32 %phi15 )
	%r127 = call %struct.node* @add(%struct.node* %phi18, i32 %r126 )
	br label %L75
L75:
	%phi19 = phi %struct.node* [%phi20, %L73], [%phi20, %L74]
	%phi21 = phi i32 [%phi15, %L73], [%phi15, %L74]
	%phi22 = phi %struct.node* [%phi14, %L73], [%phi14, %L74]
	%phi23 = phi i32 [%phi16, %L73], [%phi16, %L74]
	%phi24 = phi %struct.node* [%r125, %L73], [%phi17, %L74]
	%phi25 = phi %struct.node* [%phi18, %L73], [%r127, %L74]
	%r128 = getelementptr %struct.node , %struct.node* %phi19, i1 0, i32 1
	%r129 = load %struct.node*, %struct.node** %r128
	%r130 = add i32 %phi21, 1
	%r131 = icmp ne %struct.node* %r129, null
	%r132 = zext i1 %r131 to i32
	%r133 = trunc i32 %r132 to i1
	br i1 %r133, label %L71, label %L72

L72:
	%phi26 = phi %struct.node* [%list, %L70], [%phi22, %L75]
	%phi27 = phi %struct.node* [null, %L70], [%phi25, %L75]
	%phi28 = phi %struct.node* [null, %L70], [%phi24, %L75]
	call void @freeList(%struct.node* %phi26 )
	%r134 = call %struct.node* @quickSort(%struct.node* %phi27 )
	%r135 = call %struct.node* @quickSort(%struct.node* %phi28 )
	%r136 = call %struct.node* @concatLists(%struct.node* %r134, %struct.node* %r135 )
	br label %L67
L67:
	%phi29 = phi %struct.node* [%list, %L68], [%r136, %L72]
	ret %struct.node* %phi29
}

define %struct.node* @quickSortMain(%struct.node* %list)
{

L77:
	call void @printList(%struct.node* %list )
	%r137 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r137)
	call void @printList(%struct.node* %list )
	%r138 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r138)
	call void @printList(%struct.node* %list )
	%r139 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r139)
	br label %L78
L78:
	%phi30 = phi %struct.node* [null, %L77]
	ret %struct.node* %phi30
}

define i32 @treesearch(%struct.tnode* %root, i32 %target)
{

L80:
	%r140 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r140)
	%r141 = icmp ne %struct.tnode* %root, null
	%r142 = zext i1 %r141 to i32
	%r143 = trunc i32 %r142 to i1
	br i1 %r143, label %L82, label %L83

L82:
	%r144 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r145 = load i32, i32* %r144
	%r146 = icmp eq i32 %r145, %target
	%r147 = zext i1 %r146 to i32
	%r148 = trunc i32 %r147 to i1
	br i1 %r148, label %L85, label %L86

L83:
	br label %L84
L84:
	br label %L81
L85:
	br label %L81
L86:
	br label %L87
L87:
	%r149 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r150 = load %struct.tnode*, %struct.tnode** %r149
	%r151 = call i32 @treesearch(%struct.tnode* %r150, i32 %target )
	%r152 = icmp eq i32 %r151, 1
	%r153 = zext i1 %r152 to i32
	%r154 = trunc i32 %r153 to i1
	br i1 %r154, label %L88, label %L89

L88:
	br label %L81
L89:
	br label %L90
L90:
	%r155 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r156 = load %struct.tnode*, %struct.tnode** %r155
	%r157 = call i32 @treesearch(%struct.tnode* %r156, i32 %target )
	%r158 = icmp eq i32 %r157, 1
	%r159 = zext i1 %r158 to i32
	%r160 = trunc i32 %r159 to i1
	br i1 %r160, label %L91, label %L92

L91:
	br label %L81
L92:
	br label %L81
L81:
	%phi31 = phi i32 [1, %L85], [1, %L88], [1, %L91], [0, %L92], [0, %L84]
	ret i32 %phi31
}

define %struct.node* @inOrder(%struct.tnode* %root)
{

L95:
	%r161 = icmp ne %struct.tnode* %root, null
	%r162 = zext i1 %r161 to i32
	%r163 = trunc i32 %r162 to i1
	br i1 %r163, label %L97, label %L98

L97:
	%r164 = call i8* @malloc(i32 16)
	%r165 = bitcast i8* %r164 to %struct.node*
	%r166 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r167 = load i32, i32* %r166
	%r168 = getelementptr %struct.node , %struct.node* %r165, i1 0, i32 0
	store i32 %r167, i32* %r168
	%r169 = getelementptr %struct.node , %struct.node* %r165, i1 0, i32 1
	store %struct.node* null, %struct.node** %r169
	%r170 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r171 = load %struct.tnode*, %struct.tnode** %r170
	%r172 = call %struct.node* @inOrder(%struct.tnode* %r171 )
	%r173 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r174 = load %struct.tnode*, %struct.tnode** %r173
	%r175 = call %struct.node* @inOrder(%struct.tnode* %r174 )
	%r176 = call %struct.node* @concatLists(%struct.node* %r165, %struct.node* %r175 )
	%r177 = call %struct.node* @concatLists(%struct.node* %r172, %struct.node* %r176 )
	br label %L96
L98:
	br label %L96
L96:
	%phi32 = phi %struct.node* [%r177, %L97], [null, %L98]
	ret %struct.node* %phi32
}

define i32 @bintreesearch(%struct.tnode* %root, i32 %target)
{

L101:
	%r178 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r178)
	%r179 = icmp ne %struct.tnode* %root, null
	%r180 = zext i1 %r179 to i32
	%r181 = trunc i32 %r180 to i1
	br i1 %r181, label %L103, label %L104

L103:
	%r182 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r183 = load i32, i32* %r182
	%r184 = icmp eq i32 %r183, %target
	%r185 = zext i1 %r184 to i32
	%r186 = trunc i32 %r185 to i1
	br i1 %r186, label %L106, label %L107

L104:
	br label %L105
L105:
	br label %L102
L106:
	br label %L102
L107:
	br label %L108
L108:
	%r187 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r188 = load i32, i32* %r187
	%r189 = icmp slt i32 %target, %r188
	%r190 = zext i1 %r189 to i32
	%r191 = trunc i32 %r190 to i1
	br i1 %r191, label %L109, label %L110

L109:
	%r192 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r193 = load %struct.tnode*, %struct.tnode** %r192
	%r194 = call i32 @bintreesearch(%struct.tnode* %r193, i32 %target )
	br label %L102
L110:
	%r195 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r196 = load %struct.tnode*, %struct.tnode** %r195
	%r197 = call i32 @bintreesearch(%struct.tnode* %r196, i32 %target )
	br label %L102
L102:
	%phi33 = phi i32 [1, %L106], [%r194, %L109], [%r197, %L110], [0, %L105]
	ret i32 %phi33
}

define %struct.tnode* @buildTree(%struct.node* %list)
{

L113:
	%r198 = call i32 @size(%struct.node* %list )
	%r199 = icmp slt i32 0, %r198
	%r200 = zext i1 %r199 to i32
	%r201 = trunc i32 %r200 to i1
	br i1 %r201, label %L115, label %L116

L115:
	%phi34 = phi %struct.tnode* [null, %L113], [%r203, %L115]
	%phi35 = phi %struct.node* [%list, %L113], [%phi35, %L115]
	%phi36 = phi i32 [0, %L113], [%r204, %L115]
	%r202 = call i32 @get(%struct.node* %phi35, i32 %phi36 )
	%r203 = call %struct.tnode* @treeadd(%struct.tnode* %phi34, i32 %r202 )
	%r204 = add i32 %phi36, 1
	%r205 = call i32 @size(%struct.node* %phi35 )
	%r206 = icmp slt i32 %r204, %r205
	%r207 = zext i1 %r206 to i32
	%r208 = trunc i32 %r207 to i1
	br i1 %r208, label %L115, label %L116

L116:
	%phi37 = phi %struct.tnode* [null, %L113], [%r203, %L115]
	br label %L114
L114:
	%phi38 = phi %struct.tnode* [%phi37, %L116]
	ret %struct.tnode* %phi38
}

define void @treeMain(%struct.node* %list)
{

L118:
	%r209 = call %struct.tnode* @buildTree(%struct.node* %list )
	call void @treeprint(%struct.tnode* %r209 )
	%r210 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r210)
	%r211 = call %struct.node* @inOrder(%struct.tnode* %r209 )
	call void @printList(%struct.node* %r211 )
	%r212 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r212)
	call void @freeList(%struct.node* %r211 )
	%r213 = call %struct.node* @postOrder(%struct.tnode* %r209 )
	call void @printList(%struct.node* %r213 )
	%r214 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r214)
	call void @freeList(%struct.node* %r213 )
	%r215 = call i32 @treesearch(%struct.tnode* %r209, i32 0 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r215)
	%r216 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r216)
	%r217 = call i32 @treesearch(%struct.tnode* %r209, i32 10 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r217)
	%r218 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r218)
	%r219 = sub i32 0, 2
	%r220 = call i32 @treesearch(%struct.tnode* %r209, i32 %r219 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r220)
	%r221 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r221)
	%r222 = call i32 @treesearch(%struct.tnode* %r209, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r222)
	%r223 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r223)
	%r224 = call i32 @treesearch(%struct.tnode* %r209, i32 3 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r224)
	%r225 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r225)
	%r226 = call i32 @treesearch(%struct.tnode* %r209, i32 9 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r226)
	%r227 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r227)
	%r228 = call i32 @treesearch(%struct.tnode* %r209, i32 1 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r228)
	%r229 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r229)
	%r230 = call i32 @bintreesearch(%struct.tnode* %r209, i32 0 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r230)
	%r231 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r231)
	%r232 = call i32 @bintreesearch(%struct.tnode* %r209, i32 10 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r232)
	%r233 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r233)
	%r234 = sub i32 0, 2
	%r235 = call i32 @bintreesearch(%struct.tnode* %r209, i32 %r234 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r235)
	%r236 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r236)
	%r237 = call i32 @bintreesearch(%struct.tnode* %r209, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r237)
	%r238 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r238)
	%r239 = call i32 @bintreesearch(%struct.tnode* %r209, i32 3 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r239)
	%r240 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r240)
	%r241 = call i32 @bintreesearch(%struct.tnode* %r209, i32 9 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r241)
	%r242 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r242)
	%r243 = call i32 @bintreesearch(%struct.tnode* %r209, i32 1 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r243)
	%r244 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r244)
	call void @freeTree(%struct.tnode* %r209 )
	br label %L119
L119:
	ret void
}

define %struct.node* @myCopy(%struct.node* %src)
{

L121:
	%r245 = icmp eq %struct.node* %src, null
	%r246 = zext i1 %r245 to i32
	%r247 = trunc i32 %r246 to i1
	br i1 %r247, label %L123, label %L124

L123:
	br label %L122
L124:
	br label %L125
L125:
	%r248 = getelementptr %struct.node , %struct.node* %src, i1 0, i32 0
	%r249 = load i32, i32* %r248
	%r250 = call %struct.node* @add(%struct.node* null, i32 %r249 )
	%r251 = getelementptr %struct.node , %struct.node* %src, i1 0, i32 1
	%r252 = load %struct.node*, %struct.node** %r251
	%r253 = call %struct.node* @myCopy(%struct.node* %r252 )
	%r254 = call %struct.node* @concatLists(%struct.node* %r250, %struct.node* %r253 )
	br label %L122
L122:
	%phi39 = phi %struct.node* [null, %L123], [%r254, %L125]
	ret %struct.node* %phi39
}

define i32 @main()
{

L127:
	%r255 = icmp slt i32 0, 10
	%r256 = zext i1 %r255 to i32
	%r257 = trunc i32 %r256 to i1
	br i1 %r257, label %L129, label %L130

L129:
	%phi40 = phi %struct.node* [null, %L127], [%r259, %L129]
	%phi41 = phi i32 [0, %L127], [%r263, %L129]
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r258 = load i32, i32* @.read_scratch
	%r259 = call %struct.node* @add(%struct.node* %phi40, i32 %r258 )
	%r260 = call %struct.node* @myCopy(%struct.node* %r259 )
	%r261 = call %struct.node* @myCopy(%struct.node* %r259 )
	%r262 = call %struct.node* @quickSortMain(%struct.node* %r260 )
	call void @freeList(%struct.node* %r262 )
	call void @treeMain(%struct.node* %r261 )
	%r263 = add i32 %phi41, 1
	%r264 = icmp slt i32 %r263, 10
	%r265 = zext i1 %r264 to i32
	%r266 = trunc i32 %r265 to i1
	br i1 %r266, label %L129, label %L130

L130:
	%phi42 = phi %struct.node* [null, %L127], [%r259, %L129]
	%phi43 = phi %struct.node* [null, %L127], [%r260, %L129]
	%phi44 = phi %struct.node* [null, %L127], [%r261, %L129]
	call void @freeList(%struct.node* %phi42 )
	call void @freeList(%struct.node* %phi43 )
	call void @freeList(%struct.node* %phi44 )
	br label %L128
L128:
	%phi45 = phi i32 [0, %L130]
	ret i32 %phi45
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8