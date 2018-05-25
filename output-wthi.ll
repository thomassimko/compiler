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
	%r8 = phi %struct.node* [%first, %L5], [%r10, %L6]
	%r17 = phi %struct.node* [%second, %L5], [%r17, %L6]
	%r21 = phi %struct.node* [%first, %L5], [%r21, %L6]
	%r9 = getelementptr %struct.node , %struct.node* %r8, i1 0, i32 1
	%r10 = load %struct.node*, %struct.node** %r9
	%r11 = getelementptr %struct.node , %struct.node* %r10, i1 0, i32 1
	%r12 = load %struct.node*, %struct.node** %r11
	%r13 = icmp ne %struct.node* %r12, null
	%r14 = zext i1 %r13 to i32
	%r15 = trunc i32 %r14 to i1
	br i1 %r15, label %L6, label %L7

L7:
	%r16 = phi %struct.node* [%second, %L5], [%r17, %L6]
	%r18 = phi %struct.node* [%first, %L5], [%r10, %L6]
	%r20 = phi %struct.node* [%first, %L5], [%r21, %L6]
	%r19 = getelementptr %struct.node , %struct.node* %r18, i1 0, i32 1
	store %struct.node* %r16, %struct.node** %r19
	br label %L2
L2:
	%r22 = phi %struct.node* [%second, %L3], [%r20, %L7]
	ret %struct.node* %r22
}

define %struct.node* @add(%struct.node* %list, i32 %toAdd)
{

L9:
	%r23 = call i8* @malloc(i32 16)
	%r24 = bitcast i8* %r23 to %struct.node*
	%r25 = getelementptr %struct.node , %struct.node* %r24, i1 0, i32 0
	store i32 %toAdd, i32* %r25
	%r26 = getelementptr %struct.node , %struct.node* %r24, i1 0, i32 1
	store %struct.node* %list, %struct.node** %r26
	br label %L10
L10:
	%r27 = phi %struct.node* [%r24, %L9]
	ret %struct.node* %r27
}

define i32 @size(%struct.node* %list)
{

L12:
	%r28 = icmp eq %struct.node* %list, null
	%r29 = zext i1 %r28 to i32
	%r30 = trunc i32 %r29 to i1
	br i1 %r30, label %L14, label %L15

L14:
	br label %L13
L15:
	br label %L16
L16:
	%r31 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r32 = load %struct.node*, %struct.node** %r31
	%r33 = call i32 @size(%struct.node* %r32 )
	%r34 = add i32 1, %r33
	br label %L13
L13:
	%r35 = phi i32 [0, %L14], [%r34, %L16]
	ret i32 %r35
}

define i32 @get(%struct.node* %list, i32 %index)
{

L18:
	%r36 = icmp eq i32 %index, 0
	%r37 = zext i1 %r36 to i32
	%r38 = trunc i32 %r37 to i1
	br i1 %r38, label %L20, label %L21

L20:
	%r39 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r40 = load i32, i32* %r39
	br label %L19
L21:
	br label %L22
L22:
	%r41 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r42 = load %struct.node*, %struct.node** %r41
	%r43 = sub i32 %index, 1
	%r44 = call i32 @get(%struct.node* %r42, i32 %r43 )
	br label %L19
L19:
	%r45 = phi i32 [%r40, %L20], [%r44, %L22]
	ret i32 %r45
}

define %struct.node* @pop(%struct.node* %list)
{

L24:
	%r46 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r47 = load %struct.node*, %struct.node** %r46
	br label %L25
L25:
	%r48 = phi %struct.node* [%r47, %L24]
	ret %struct.node* %r48
}

define void @printList(%struct.node* %list)
{

L27:
	%r49 = icmp ne %struct.node* %list, null
	%r50 = zext i1 %r49 to i32
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L29, label %L30

L29:
	%r52 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r53 = load i32, i32* %r52
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r53)
	%r54 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r55 = load %struct.node*, %struct.node** %r54
	call void @printList(%struct.node* %r55 )
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
	%r56 = icmp ne %struct.tnode* %root, null
	%r57 = zext i1 %r56 to i32
	%r58 = trunc i32 %r57 to i1
	br i1 %r58, label %L35, label %L36

L35:
	%r59 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r60 = load %struct.tnode*, %struct.tnode** %r59
	call void @treeprint(%struct.tnode* %r60 )
	%r61 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r62 = load i32, i32* %r61
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r62)
	%r63 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r64 = load %struct.tnode*, %struct.tnode** %r63
	call void @treeprint(%struct.tnode* %r64 )
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
	%r65 = icmp ne %struct.node* %list, null
	%r66 = zext i1 %r65 to i32
	%r67 = trunc i32 %r66 to i1
	br i1 %r67, label %L41, label %L42

L41:
	%r68 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r69 = load %struct.node*, %struct.node** %r68
	call void @freeList(%struct.node* %r69 )
	%r70 = bitcast %struct.node* %list to i8*
	call void @free(i8* %r70 )
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
	%r71 = icmp eq %struct.tnode* %root, null
	%r72 = zext i1 %r71 to i32
	%r73 = xor i32 %r72, 1
	%r74 = trunc i32 1 to i1
	br i1 %r74, label %L47, label %L48

L47:
	%r75 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r76 = load %struct.tnode*, %struct.tnode** %r75
	call void @freeTree(%struct.tnode* %r76 )
	%r77 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r78 = load %struct.tnode*, %struct.tnode** %r77
	call void @freeTree(%struct.tnode* %r78 )
	%r79 = bitcast %struct.tnode* %root to i8*
	call void @free(i8* %r79 )
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
	%r80 = icmp ne %struct.tnode* %root, null
	%r81 = zext i1 %r80 to i32
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L53, label %L54

L53:
	%r83 = call i8* @malloc(i32 16)
	%r84 = bitcast i8* %r83 to %struct.node*
	%r85 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r86 = load i32, i32* %r85
	%r87 = getelementptr %struct.node , %struct.node* %r84, i1 0, i32 0
	store i32 %r86, i32* %r87
	%r88 = getelementptr %struct.node , %struct.node* %r84, i1 0, i32 1
	store %struct.node* null, %struct.node** %r88
	%r89 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r90 = load %struct.tnode*, %struct.tnode** %r89
	%r91 = call %struct.node* @postOrder(%struct.tnode* %r90 )
	%r92 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r93 = load %struct.tnode*, %struct.tnode** %r92
	%r94 = call %struct.node* @postOrder(%struct.tnode* %r93 )
	%r95 = call %struct.node* @concatLists(%struct.node* %r91, %struct.node* %r94 )
	%r96 = call %struct.node* @concatLists(%struct.node* %r95, %struct.node* %r84 )
	br label %L52
L54:
	br label %L55
L55:
	br label %L52
L52:
	%r97 = phi %struct.node* [%r96, %L53], [null, %L55]
	ret %struct.node* %r97
}

define %struct.tnode* @treeadd(%struct.tnode* %root, i32 %toAdd)
{

L57:
	%r98 = icmp eq %struct.tnode* %root, null
	%r99 = zext i1 %r98 to i32
	%r100 = trunc i32 %r99 to i1
	br i1 %r100, label %L59, label %L60

L59:
	%r101 = call i8* @malloc(i32 24)
	%r102 = bitcast i8* %r101 to %struct.tnode*
	%r103 = getelementptr %struct.tnode , %struct.tnode* %r102, i1 0, i32 0
	store i32 %toAdd, i32* %r103
	%r104 = getelementptr %struct.tnode , %struct.tnode* %r102, i1 0, i32 1
	store %struct.tnode* null, %struct.tnode** %r104
	%r105 = getelementptr %struct.tnode , %struct.tnode* %r102, i1 0, i32 2
	store %struct.tnode* null, %struct.tnode** %r105
	br label %L58
L60:
	br label %L61
L61:
	%r106 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r107 = load i32, i32* %r106
	%r108 = icmp slt i32 %toAdd, %r107
	%r109 = zext i1 %r108 to i32
	%r110 = trunc i32 %r109 to i1
	br i1 %r110, label %L62, label %L63

L62:
	%r111 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r112 = load %struct.tnode*, %struct.tnode** %r111
	%r113 = call %struct.tnode* @treeadd(%struct.tnode* %r112, i32 %toAdd )
	%r114 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	store %struct.tnode* %r113, %struct.tnode** %r114
	br label %L64
L63:
	%r115 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r116 = load %struct.tnode*, %struct.tnode** %r115
	%r117 = call %struct.tnode* @treeadd(%struct.tnode* %r116, i32 %toAdd )
	%r118 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	store %struct.tnode* %r117, %struct.tnode** %r118
	br label %L64
L64:
	%r119 = phi %struct.tnode* [%root, %L62], [%root, %L63]
	br label %L58
L58:
	%r120 = phi %struct.tnode* [%r102, %L59], [%r119, %L64]
	ret %struct.tnode* %r120
}

define %struct.node* @quickSort(%struct.node* %list)
{

L66:
	%r121 = call i32 @size(%struct.node* %list )
	%r122 = icmp sle i32 %r121, 1
	%r123 = zext i1 %r122 to i32
	%r124 = trunc i32 %r123 to i1
	br i1 %r124, label %L68, label %L69

L68:
	br label %L67
L69:
	br label %L70
L70:
	%r125 = call i32 @get(%struct.node* %list, i32 0 )
	%r126 = call i32 @size(%struct.node* %list )
	%r127 = sub i32 %r126, 1
	%r128 = call i32 @get(%struct.node* %list, i32 %r127 )
	%r129 = add i32 %r125, %r128
	%r130 = sdiv i32 %r129, 2
	%r131 = icmp ne %struct.node* %list, null
	%r132 = zext i1 %r131 to i32
	%r133 = trunc i32 %r132 to i1
	br i1 %r133, label %L71, label %L72

L71:
	%r134 = phi %struct.node* [%list, %L70], [%r156, %L75]
	%r135 = phi i32 [0, %L70], [%r152, %L75]
	%r137 = phi i32 [%r130, %L70], [%r157, %L75]
	%r141 = phi %struct.node* [null, %L70], [%r158, %L75]
	%r144 = phi %struct.node* [null, %L70], [%r159, %L75]
	%r148 = phi %struct.node* [%list, %L70], [%r150, %L75]
	%r136 = call i32 @get(%struct.node* %r134, i32 %r135 )
	%r138 = icmp sgt i32 %r136, %r137
	%r139 = zext i1 %r138 to i32
	%r140 = trunc i32 %r139 to i1
	br i1 %r140, label %L73, label %L74

L73:
	%r142 = call i32 @get(%struct.node* %r134, i32 %r135 )
	%r143 = call %struct.node* @add(%struct.node* %r141, i32 %r142 )
	br label %L75
L74:
	%r145 = call i32 @get(%struct.node* %r134, i32 %r135 )
	%r146 = call %struct.node* @add(%struct.node* %r144, i32 %r145 )
	br label %L75
L75:
	%r147 = phi %struct.node* [%r148, %L73], [%r148, %L74]
	%r151 = phi i32 [%r135, %L73], [%r135, %L74]
	%r156 = phi %struct.node* [%r134, %L73], [%r134, %L74]
	%r157 = phi i32 [%r137, %L73], [%r137, %L74]
	%r158 = phi %struct.node* [%r143, %L73], [%r141, %L74]
	%r159 = phi %struct.node* [%r144, %L73], [%r146, %L74]
	%r149 = getelementptr %struct.node , %struct.node* %r147, i1 0, i32 1
	%r150 = load %struct.node*, %struct.node** %r149
	%r152 = add i32 %r151, 1
	%r153 = icmp ne %struct.node* %r150, null
	%r154 = zext i1 %r153 to i32
	%r155 = trunc i32 %r154 to i1
	br i1 %r155, label %L71, label %L72

L72:
	%r160 = phi %struct.node* [%list, %L70], [%r156, %L75]
	%r161 = phi %struct.node* [null, %L70], [%r159, %L75]
	%r163 = phi %struct.node* [null, %L70], [%r158, %L75]
	call void @freeList(%struct.node* %r160 )
	%r162 = call %struct.node* @quickSort(%struct.node* %r161 )
	%r164 = call %struct.node* @quickSort(%struct.node* %r163 )
	%r165 = call %struct.node* @concatLists(%struct.node* %r162, %struct.node* %r164 )
	br label %L67
L67:
	%r166 = phi %struct.node* [%list, %L68], [%r165, %L72]
	ret %struct.node* %r166
}

define %struct.node* @quickSortMain(%struct.node* %list)
{

L77:
	call void @printList(%struct.node* %list )
	%r167 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	call void @printList(%struct.node* %list )
	%r168 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	call void @printList(%struct.node* %list )
	%r169 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	br label %L78
L78:
	%r170 = phi %struct.node* [null, %L77]
	ret %struct.node* %r170
}

define i32 @treesearch(%struct.tnode* %root, i32 %target)
{

L80:
	%r171 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -1)
	%r172 = icmp ne %struct.tnode* %root, null
	%r173 = zext i1 %r172 to i32
	%r174 = trunc i32 %r173 to i1
	br i1 %r174, label %L82, label %L83

L82:
	%r175 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r176 = load i32, i32* %r175
	%r177 = icmp eq i32 %r176, %target
	%r178 = zext i1 %r177 to i32
	%r179 = trunc i32 %r178 to i1
	br i1 %r179, label %L85, label %L86

L83:
	br label %L84
L84:
	br label %L81
L85:
	br label %L81
L86:
	br label %L87
L87:
	%r180 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r181 = load %struct.tnode*, %struct.tnode** %r180
	%r182 = call i32 @treesearch(%struct.tnode* %r181, i32 %target )
	%r183 = icmp eq i32 %r182, 1
	%r184 = zext i1 %r183 to i32
	%r185 = trunc i32 %r184 to i1
	br i1 %r185, label %L88, label %L89

L88:
	br label %L81
L89:
	br label %L90
L90:
	%r186 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r187 = load %struct.tnode*, %struct.tnode** %r186
	%r188 = call i32 @treesearch(%struct.tnode* %r187, i32 %target )
	%r189 = icmp eq i32 %r188, 1
	%r190 = zext i1 %r189 to i32
	%r191 = trunc i32 %r190 to i1
	br i1 %r191, label %L91, label %L92

L91:
	br label %L81
L92:
	br label %L81
L81:
	%r192 = phi i32 [1, %L85], [1, %L88], [1, %L91], [0, %L92], [0, %L84]
	ret i32 %r192
}

define %struct.node* @inOrder(%struct.tnode* %root)
{

L95:
	%r193 = icmp ne %struct.tnode* %root, null
	%r194 = zext i1 %r193 to i32
	%r195 = trunc i32 %r194 to i1
	br i1 %r195, label %L97, label %L98

L97:
	%r196 = call i8* @malloc(i32 16)
	%r197 = bitcast i8* %r196 to %struct.node*
	%r198 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r199 = load i32, i32* %r198
	%r200 = getelementptr %struct.node , %struct.node* %r197, i1 0, i32 0
	store i32 %r199, i32* %r200
	%r201 = getelementptr %struct.node , %struct.node* %r197, i1 0, i32 1
	store %struct.node* null, %struct.node** %r201
	%r202 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r203 = load %struct.tnode*, %struct.tnode** %r202
	%r204 = call %struct.node* @inOrder(%struct.tnode* %r203 )
	%r205 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r206 = load %struct.tnode*, %struct.tnode** %r205
	%r207 = call %struct.node* @inOrder(%struct.tnode* %r206 )
	%r208 = call %struct.node* @concatLists(%struct.node* %r197, %struct.node* %r207 )
	%r209 = call %struct.node* @concatLists(%struct.node* %r204, %struct.node* %r208 )
	br label %L96
L98:
	br label %L96
L96:
	%r210 = phi %struct.node* [%r209, %L97], [null, %L98]
	ret %struct.node* %r210
}

define i32 @bintreesearch(%struct.tnode* %root, i32 %target)
{

L101:
	%r211 = sub i32 0, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -1)
	%r212 = icmp ne %struct.tnode* %root, null
	%r213 = zext i1 %r212 to i32
	%r214 = trunc i32 %r213 to i1
	br i1 %r214, label %L103, label %L104

L103:
	%r215 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r216 = load i32, i32* %r215
	%r217 = icmp eq i32 %r216, %target
	%r218 = zext i1 %r217 to i32
	%r219 = trunc i32 %r218 to i1
	br i1 %r219, label %L106, label %L107

L104:
	br label %L105
L105:
	br label %L102
L106:
	br label %L102
L107:
	br label %L108
L108:
	%r220 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 0
	%r221 = load i32, i32* %r220
	%r222 = icmp slt i32 %target, %r221
	%r223 = zext i1 %r222 to i32
	%r224 = trunc i32 %r223 to i1
	br i1 %r224, label %L109, label %L110

L109:
	%r225 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 1
	%r226 = load %struct.tnode*, %struct.tnode** %r225
	%r227 = call i32 @bintreesearch(%struct.tnode* %r226, i32 %target )
	br label %L102
L110:
	%r228 = getelementptr %struct.tnode , %struct.tnode* %root, i1 0, i32 2
	%r229 = load %struct.tnode*, %struct.tnode** %r228
	%r230 = call i32 @bintreesearch(%struct.tnode* %r229, i32 %target )
	br label %L102
L102:
	%r231 = phi i32 [1, %L106], [%r227, %L109], [%r230, %L110], [0, %L105]
	ret i32 %r231
}

define %struct.tnode* @buildTree(%struct.node* %list)
{

L113:
	%r232 = call i32 @size(%struct.node* %list )
	%r233 = icmp slt i32 0, %r232
	%r234 = zext i1 %r233 to i32
	%r235 = trunc i32 %r234 to i1
	br i1 %r235, label %L115, label %L116

L115:
	%r236 = phi %struct.tnode* [null, %L113], [%r240, %L115]
	%r237 = phi %struct.node* [%list, %L113], [%r237, %L115]
	%r238 = phi i32 [0, %L113], [%r241, %L115]
	%r239 = call i32 @get(%struct.node* %r237, i32 %r238 )
	%r240 = call %struct.tnode* @treeadd(%struct.tnode* %r236, i32 %r239 )
	%r241 = add i32 %r238, 1
	%r242 = call i32 @size(%struct.node* %r237 )
	%r243 = icmp slt i32 %r241, %r242
	%r244 = zext i1 %r243 to i32
	%r245 = trunc i32 %r244 to i1
	br i1 %r245, label %L115, label %L116

L116:
	%r246 = phi %struct.tnode* [null, %L113], [%r240, %L115]
	br label %L114
L114:
	%r247 = phi %struct.tnode* [%r246, %L116]
	ret %struct.tnode* %r247
}

define void @treeMain(%struct.node* %list)
{

L118:
	%r248 = call %struct.tnode* @buildTree(%struct.node* %list )
	call void @treeprint(%struct.tnode* %r248 )
	%r249 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r250 = call %struct.node* @inOrder(%struct.tnode* %r248 )
	call void @printList(%struct.node* %r250 )
	%r251 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	call void @freeList(%struct.node* %r250 )
	%r252 = call %struct.node* @postOrder(%struct.tnode* %r248 )
	call void @printList(%struct.node* %r252 )
	%r253 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	call void @freeList(%struct.node* %r252 )
	%r254 = call i32 @treesearch(%struct.tnode* %r248, i32 0 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r254)
	%r255 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r256 = call i32 @treesearch(%struct.tnode* %r248, i32 10 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r256)
	%r257 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r258 = sub i32 0, 2
	%r259 = call i32 @treesearch(%struct.tnode* %r248, i32 -2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r259)
	%r260 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r261 = call i32 @treesearch(%struct.tnode* %r248, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r261)
	%r262 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r263 = call i32 @treesearch(%struct.tnode* %r248, i32 3 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r263)
	%r264 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r265 = call i32 @treesearch(%struct.tnode* %r248, i32 9 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r265)
	%r266 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r267 = call i32 @treesearch(%struct.tnode* %r248, i32 1 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r267)
	%r268 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r269 = call i32 @bintreesearch(%struct.tnode* %r248, i32 0 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r269)
	%r270 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r271 = call i32 @bintreesearch(%struct.tnode* %r248, i32 10 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r271)
	%r272 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r273 = sub i32 0, 2
	%r274 = call i32 @bintreesearch(%struct.tnode* %r248, i32 -2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r274)
	%r275 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r276 = call i32 @bintreesearch(%struct.tnode* %r248, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r276)
	%r277 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r278 = call i32 @bintreesearch(%struct.tnode* %r248, i32 3 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r278)
	%r279 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r280 = call i32 @bintreesearch(%struct.tnode* %r248, i32 9 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r280)
	%r281 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	%r282 = call i32 @bintreesearch(%struct.tnode* %r248, i32 1 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r282)
	%r283 = sub i32 0, 999
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -999)
	call void @freeTree(%struct.tnode* %r248 )
	br label %L119
L119:
	ret void
}

define %struct.node* @myCopy(%struct.node* %src)
{

L121:
	%r284 = icmp eq %struct.node* %src, null
	%r285 = zext i1 %r284 to i32
	%r286 = trunc i32 %r285 to i1
	br i1 %r286, label %L123, label %L124

L123:
	br label %L122
L124:
	br label %L125
L125:
	%r287 = getelementptr %struct.node , %struct.node* %src, i1 0, i32 0
	%r288 = load i32, i32* %r287
	%r289 = call %struct.node* @add(%struct.node* null, i32 %r288 )
	%r290 = getelementptr %struct.node , %struct.node* %src, i1 0, i32 1
	%r291 = load %struct.node*, %struct.node** %r290
	%r292 = call %struct.node* @myCopy(%struct.node* %r291 )
	%r293 = call %struct.node* @concatLists(%struct.node* %r289, %struct.node* %r292 )
	br label %L122
L122:
	%r294 = phi %struct.node* [null, %L123], [%r293, %L125]
	ret %struct.node* %r294
}

define i32 @main()
{

L127:
	%r295 = icmp slt i32 0, 10
	%r296 = zext i1 1 to i32
	%r297 = trunc i32 1 to i1
	br i1 %r297, label %L129, label %L130

L129:
	%r299 = phi %struct.node* [null, %L127], [%r300, %L129]
	%r304 = phi i32 [0, %L127], [%r305, %L129]
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r298 = load i32, i32* @.read_scratch
	%r300 = call %struct.node* @add(%struct.node* %r299, i32 %r298 )
	%r301 = call %struct.node* @myCopy(%struct.node* %r300 )
	%r302 = call %struct.node* @myCopy(%struct.node* %r300 )
	%r303 = call %struct.node* @quickSortMain(%struct.node* %r301 )
	call void @freeList(%struct.node* %r303 )
	call void @treeMain(%struct.node* %r302 )
	%r305 = add i32 %r304, 1
	%r306 = icmp slt i32 %r305, 10
	%r307 = zext i1 %r306 to i32
	%r308 = trunc i32 %r307 to i1
	br i1 %r308, label %L129, label %L130

L130:
	%r309 = phi %struct.node* [null, %L127], [%r300, %L129]
	%r310 = phi %struct.node* [null, %L127], [%r301, %L129]
	%r311 = phi %struct.node* [null, %L127], [%r302, %L129]
	call void @freeList(%struct.node* %r309 )
	call void @freeList(%struct.node* %r310 )
	call void @freeList(%struct.node* %r311 )
	br label %L128
L128:
	%r312 = phi i32 [0, %L130]
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