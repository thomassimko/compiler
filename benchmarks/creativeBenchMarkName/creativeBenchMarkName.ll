target triple="i686"

%struct.node = type {%struct.node*, i32}

define i32 @multiple(%struct.node* %list)
{

L4:
	%r31 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r32 = load i32, i32* %r31
	%r33 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r34 = load %struct.node*, %struct.node** %r33
	br i1 1, label %L6, label %L7

L6:
	%r38 = phi i32 [%r32, %L4], [%r42, %L6]
	%r39 = phi %struct.node* [%r34, %L4], [%r44, %L6]
	%r45 = phi i32 [0, %L4], [%r46, %L6]
	%r40 = getelementptr %struct.node , %struct.node* %r39, i1 0, i32 1
	%r41 = load i32, i32* %r40
	%r42 = mul i32 %r38, %r41
	%r43 = getelementptr %struct.node , %struct.node* %r39, i1 0, i32 0
	%r44 = load %struct.node*, %struct.node** %r43
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r42)
	%r46 = add i32 %r45, 1
	%r47 = icmp slt i32 %r46, 5
	%r48 = zext i1 %r47 to i32
	%r49 = trunc i32 %r48 to i1
	br i1 %r49, label %L6, label %L7

L7:
	%r50 = phi i32 [%r32, %L4], [%r42, %L6]
	br label %L5
L5:
	ret i32 %r50
}

define i32 @add(%struct.node* %list)
{

L9:
	%r52 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r53 = load i32, i32* %r52
	%r54 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r55 = load %struct.node*, %struct.node** %r54
	br i1 1, label %L11, label %L12

L11:
	%r59 = phi i32 [%r53, %L9], [%r63, %L11]
	%r60 = phi %struct.node* [%r55, %L9], [%r65, %L11]
	%r66 = phi i32 [0, %L9], [%r67, %L11]
	%r61 = getelementptr %struct.node , %struct.node* %r60, i1 0, i32 1
	%r62 = load i32, i32* %r61
	%r63 = add i32 %r59, %r62
	%r64 = getelementptr %struct.node , %struct.node* %r60, i1 0, i32 0
	%r65 = load %struct.node*, %struct.node** %r64
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r63)
	%r67 = add i32 %r66, 1
	%r68 = icmp slt i32 %r67, 5
	%r69 = zext i1 %r68 to i32
	%r70 = trunc i32 %r69 to i1
	br i1 %r70, label %L11, label %L12

L12:
	%r71 = phi i32 [%r53, %L9], [%r63, %L11]
	br label %L10
L10:
	ret i32 %r71
}

define i32 @recurseList(%struct.node* %list)
{

L14:
	%r73 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r74 = load %struct.node*, %struct.node** %r73
	%r75 = icmp eq %struct.node* %r74, null
	%r76 = zext i1 %r75 to i32
	%r77 = trunc i32 %r76 to i1
	br i1 %r77, label %L16, label %L17

L16:
	%r78 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r79 = load i32, i32* %r78
	br label %L15
L17:
	%r80 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 1
	%r81 = load i32, i32* %r80
	%r82 = getelementptr %struct.node , %struct.node* %list, i1 0, i32 0
	%r83 = load %struct.node*, %struct.node** %r82
	%r84 = call i32 @recurseList(%struct.node* %r83 )
	%r85 = mul i32 %r81, %r84
	br label %L15
L15:
	%r86 = phi i32 [%r79, %L16], [%r85, %L17]
	ret i32 %r86
}

define i32 @main()
{

L20:
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
	%r88 = call i32 @multiple(%struct.node* %r1 )
	%r89 = call i32 @add(%struct.node* %r1 )
	%r90 = sdiv i32 %r89, 2
	%r91 = sub i32 %r88, %r90
	br i1 1, label %L22, label %L23

L22:
	%r95 = phi i32 [0, %L20], [%r98, %L22]
	%r96 = phi %struct.node* [%r1, %L20], [%r96, %L22]
	%r99 = phi i32 [0, %L20], [%r100, %L22]
	%r115 = phi i32 [%r91, %L20], [%r115, %L22]
	%r97 = call i32 @recurseList(%struct.node* %r96 )
	%r98 = add i32 %r95, %r97
	%r100 = add i32 %r99, 1
	%r101 = icmp slt i32 %r100, 2
	%r102 = zext i1 %r101 to i32
	%r103 = trunc i32 %r102 to i1
	br i1 %r103, label %L22, label %L23

L23:
	%r104 = phi i32 [0, %L20], [%r98, %L22]
	%r114 = phi i32 [%r91, %L20], [%r115, %L22]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r104)
	%r105 = icmp ne i32 %r104, 0
	%r106 = zext i1 %r105 to i32
	%r107 = trunc i32 %r106 to i1
	br i1 %r107, label %L24, label %L25

L24:
	%r108 = phi i32 [%r104, %L23], [%r109, %L24]
	%r116 = phi i32 [%r114, %L23], [%r116, %L24]
	%r109 = sub i32 %r108, 1
	%r110 = icmp ne i32 %r109, 0
	%r111 = zext i1 %r110 to i32
	%r112 = trunc i32 %r111 to i1
	br i1 %r112, label %L24, label %L25

L25:
	%r113 = phi i32 [%r114, %L23], [%r116, %L24]
	%r117 = phi i32 [%r104, %L23], [%r109, %L24]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r113)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r117)
	br label %L21
L21:
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