target triple="i686"

%struct.intList = type {i32, %struct.intList*}
@intList = common global i32 0, align 8

define i32 @length(%struct.intList* %_P_list)
{

L1:
	%_retval_ = alloca i32
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%r0 = load %struct.intList*, %struct.intList** %list
	%r1 = icmp eq %struct.intList* %r0, null
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L3, label %L4

L3:
	store i32 0, i32* %_retval_
	br label %L2
L4:
	br label %L5
L5:
	%r5 = load %struct.intList*, %struct.intList** %list
	%r6 = getelementptr %struct.intList , %struct.intList* %r5, i1 0, i32 1
	%r7 = load %struct.intList*, %struct.intList** %r6
	%r8 = call i32 @length(%struct.intList* %r7 )
	%r9 = add i32 1, %r8
	store i32 %r9, i32* %_retval_
	br label %L2
L2:
	%r4 = load i32, i32* %_retval_
	ret i32 %r4
}

define %struct.intList* @addToFront(%struct.intList* %_P_list, i32 %_P_element)
{

L7:
	%_retval_ = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%element = alloca i32
	store i32 %_P_element, i32* %element
	%front = alloca %struct.intList*
	%r11 = load %struct.intList*, %struct.intList** %list
	%r12 = icmp eq %struct.intList* %r11, null
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L9, label %L10

L9:
	%r15 = call i8* @malloc(i32 16)
	%r16 = bitcast i8* %r15 to %struct.intList*
	store %struct.intList* %r16, %struct.intList** %list
	%r17 = load i32, i32* %element
	%r18 = load %struct.intList*, %struct.intList** %list
	%r19 = getelementptr %struct.intList , %struct.intList* %r18, i1 0, i32 0
	store i32 %r17, i32* %r19
	%r20 = load %struct.intList*, %struct.intList** %list
	%r21 = getelementptr %struct.intList , %struct.intList* %r20, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %r21
	%r22 = load %struct.intList*, %struct.intList** %list
	store %struct.intList* %r22, %struct.intList** %_retval_
	br label %L8
L10:
	br label %L11
L11:
	%r24 = call i8* @malloc(i32 16)
	%r25 = bitcast i8* %r24 to %struct.intList*
	store %struct.intList* %r25, %struct.intList** %front
	%r26 = load i32, i32* %element
	%r27 = load %struct.intList*, %struct.intList** %front
	%r28 = getelementptr %struct.intList , %struct.intList* %r27, i1 0, i32 0
	store i32 %r26, i32* %r28
	%r29 = load %struct.intList*, %struct.intList** %list
	%r30 = load %struct.intList*, %struct.intList** %front
	%r31 = getelementptr %struct.intList , %struct.intList* %r30, i1 0, i32 1
	store %struct.intList* %r29, %struct.intList** %r31
	%r32 = load %struct.intList*, %struct.intList** %front
	store %struct.intList* %r32, %struct.intList** %_retval_
	br label %L8
L8:
	%r23 = load %struct.intList*, %struct.intList** %_retval_
	ret %struct.intList* %r23
}

define %struct.intList* @deleteFirst(%struct.intList* %_P_list)
{

L13:
	%_retval_ = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%first = alloca %struct.intList*
	%r34 = load %struct.intList*, %struct.intList** %list
	%r35 = icmp eq %struct.intList* %r34, null
	%r36 = zext i1 %r35 to i32
	%r37 = trunc i32 %r36 to i1
	br i1 %r37, label %L15, label %L16

L15:
	store %struct.intList* null, %struct.intList** %_retval_
	br label %L14
L16:
	br label %L17
L17:
	%r39 = load %struct.intList*, %struct.intList** %list
	store %struct.intList* %r39, %struct.intList** %first
	%r40 = load %struct.intList*, %struct.intList** %list
	%r41 = getelementptr %struct.intList , %struct.intList* %r40, i1 0, i32 1
	%r42 = load %struct.intList*, %struct.intList** %r41
	store %struct.intList* %r42, %struct.intList** %list
	%r44 = load %struct.intList*, %struct.intList** %first
	%r43 = bitcast %struct.intList* %r44 to i8*
	call void @free(i8* %r43 )
	%r45 = load %struct.intList*, %struct.intList** %list
	store %struct.intList* %r45, %struct.intList** %_retval_
	br label %L14
L14:
	%r38 = load %struct.intList*, %struct.intList** %_retval_
	ret %struct.intList* %r38
}

define i32 @main()
{

L19:
	%_retval_ = alloca i32
	%list = alloca %struct.intList*
	%sum = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r47 = load i32, i32* @.read_scratch
	store i32 %r47, i32* @intList
	store i32 0, i32* %sum
	store %struct.intList* null, %struct.intList** %list
	%r48 = load i32, i32* @intList
	%r49 = icmp sgt i32 %r48, 0
	%r50 = zext i1 %r49 to i32
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L21, label %L22

L21:
	%r52 = load %struct.intList*, %struct.intList** %list
	%r53 = load i32, i32* @intList
	%r54 = call %struct.intList* @addToFront(%struct.intList* %r52, i32 %r53 )
	store %struct.intList* %r54, %struct.intList** %list
	%r55 = load %struct.intList*, %struct.intList** %list
	%r56 = getelementptr %struct.intList , %struct.intList* %r55, i1 0, i32 0
	%r57 = load i32, i32* %r56
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r57)
	%r58 = load i32, i32* @intList
	%r59 = sub i32 %r58, 1
	store i32 %r59, i32* @intList
	%r60 = load i32, i32* @intList
	%r61 = icmp sgt i32 %r60, 0
	%r62 = zext i1 %r61 to i32
	%r63 = trunc i32 %r62 to i1
	br i1 %r63, label %L21, label %L22

L22:
	%r64 = load %struct.intList*, %struct.intList** %list
	%r65 = call i32 @length(%struct.intList* %r64 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r65)
	%r66 = load %struct.intList*, %struct.intList** %list
	%r67 = call i32 @length(%struct.intList* %r66 )
	%r68 = icmp sgt i32 %r67, 0
	%r69 = zext i1 %r68 to i32
	%r70 = trunc i32 %r69 to i1
	br i1 %r70, label %L23, label %L24

L23:
	%r71 = load i32, i32* %sum
	%r72 = load %struct.intList*, %struct.intList** %list
	%r73 = getelementptr %struct.intList , %struct.intList* %r72, i1 0, i32 0
	%r74 = load i32, i32* %r73
	%r75 = add i32 %r71, %r74
	store i32 %r75, i32* %sum
	%r76 = load %struct.intList*, %struct.intList** %list
	%r77 = call i32 @length(%struct.intList* %r76 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r77)
	%r78 = load %struct.intList*, %struct.intList** %list
	%r79 = call %struct.intList* @deleteFirst(%struct.intList* %r78 )
	store %struct.intList* %r79, %struct.intList** %list
	%r80 = load %struct.intList*, %struct.intList** %list
	%r81 = call i32 @length(%struct.intList* %r80 )
	%r82 = icmp sgt i32 %r81, 0
	%r83 = zext i1 %r82 to i32
	%r84 = trunc i32 %r83 to i1
	br i1 %r84, label %L23, label %L24

L24:
	%r85 = load i32, i32* %sum
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r85)
	store i32 0, i32* %_retval_
	br label %L20
L20:
	%r86 = load i32, i32* %_retval_
	ret i32 %r86
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8