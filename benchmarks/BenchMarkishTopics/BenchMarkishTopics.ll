target triple="i686"

%struct.intList = type {i32, %struct.intList*}
@intList = common global i32 0, align 8

define i32 @length(%struct.intList* %_P_list)
{

L2:
	%_retval_ = alloca i32
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%r0 = load %struct.intList*, %struct.intList** %list
	%r1 = icmp eq %struct.intList* %r0, null
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L4, label %L5

L4:
	store i32 0, i32* %_retval_
	br label %L3
L5:
	br label %L6
L6:
	%r5 = load %struct.intList*, %struct.intList** %list
	%r6 = getelementptr %struct.intList , %struct.intList* %r5, i1 0, i32 1
	%r7 = load %struct.intList*, %struct.intList** %r6
	%r8 = call i32 @length(%struct.intList* %r7 )
	%r9 = add i32 1, %r8
	store i32 %r9, i32* %_retval_
	br label %L3
L3:
	%r4 = load i32, i32* %_retval_
	ret i32 %r4
}

define %struct.intList* @addToFront(%struct.intList* %_P_list, i32 %_P_element)
{

L9:
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
	br i1 %r14, label %L11, label %L12

L11:
	%r15 = call i8* @malloc(i32 16)
	%r16 = bitcast i8* %r15 to %struct.intList*
	store %struct.intList* %r16, %struct.intList** %list
	%r17 = load %struct.intList*, %struct.intList** %list
	%r18 = getelementptr %struct.intList , %struct.intList* %r17, i1 0, i32 0
	%r19 = load i32, i32* %element
	store i32 %r19, i32* %r18
	%r20 = load %struct.intList*, %struct.intList** %list
	%r21 = getelementptr %struct.intList , %struct.intList* %r20, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %r21
	%r22 = load %struct.intList*, %struct.intList** %list
	store %struct.intList* %r22, %struct.intList** %_retval_
	br label %L10
L12:
	br label %L13
L13:
	%r24 = call i8* @malloc(i32 16)
	%r25 = bitcast i8* %r24 to %struct.intList*
	store %struct.intList* %r25, %struct.intList** %front
	%r26 = load %struct.intList*, %struct.intList** %front
	%r27 = getelementptr %struct.intList , %struct.intList* %r26, i1 0, i32 0
	%r28 = load i32, i32* %element
	store i32 %r28, i32* %r27
	%r29 = load %struct.intList*, %struct.intList** %front
	%r30 = getelementptr %struct.intList , %struct.intList* %r29, i1 0, i32 1
	%r31 = load %struct.intList*, %struct.intList** %list
	store %struct.intList* %r31, %struct.intList** %r30
	%r32 = load %struct.intList*, %struct.intList** %front
	store %struct.intList* %r32, %struct.intList** %_retval_
	br label %L10
L10:
	%r23 = load %struct.intList*, %struct.intList** %_retval_
	ret %struct.intList* %r23
}

define %struct.intList* @deleteFirst(%struct.intList* %_P_list)
{

L16:
	%_retval_ = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%first = alloca %struct.intList*
	%r34 = load %struct.intList*, %struct.intList** %list
	%r35 = icmp eq %struct.intList* %r34, null
	%r36 = zext i1 %r35 to i32
	%r37 = trunc i32 %r36 to i1
	br i1 %r37, label %L18, label %L19

L18:
	store %struct.intList* null, %struct.intList** %_retval_
	br label %L17
L19:
	br label %L20
L20:
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
	br label %L17
L17:
	%r38 = load %struct.intList*, %struct.intList** %_retval_
	ret %struct.intList* %r38
}

define i32 @main()
{

L23:
	%_retval_ = alloca i32
	%list = alloca %struct.intList*
	%sum = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @intList)
	store i32 0, i32* %sum
	store %struct.intList* null, %struct.intList** %list
	%r55 = load i32, i32* @intList
	%r56 = icmp sgt i32 %r55, 0
	%r57 = zext i1 %r56 to i32
	%r58 = trunc i32 %r57 to i1
	br i1 %r58, label %L25, label %L26

L25:
	%r47 = load %struct.intList*, %struct.intList** %list
	%r48 = load i32, i32* @intList
	%r49 = call %struct.intList* @addToFront(%struct.intList* %r47, i32 %r48 )
	store %struct.intList* %r49, %struct.intList** %list
	%r50 = load %struct.intList*, %struct.intList** %list
	%r51 = getelementptr %struct.intList , %struct.intList* %r50, i1 0, i32 0
	%r52 = load i32, i32* %r51
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r52)
	%r53 = load i32, i32* @intList
	%r54 = sub i32 %r53, 1
	store i32 %r54, i32* @intList
	%r59 = load i32, i32* @intList
	%r60 = icmp sgt i32 %r59, 0
	%r61 = zext i1 %r60 to i32
	%r62 = trunc i32 %r61 to i1
	br i1 %r62, label %L25, label %L26

L26:
	%r63 = load %struct.intList*, %struct.intList** %list
	%r64 = call i32 @length(%struct.intList* %r63 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r64)
	%r74 = load %struct.intList*, %struct.intList** %list
	%r75 = call i32 @length(%struct.intList* %r74 )
	%r76 = icmp sgt i32 %r75, 0
	%r77 = zext i1 %r76 to i32
	%r78 = trunc i32 %r77 to i1
	br i1 %r78, label %L27, label %L28

L27:
	%r65 = load i32, i32* %sum
	%r66 = load %struct.intList*, %struct.intList** %list
	%r67 = getelementptr %struct.intList , %struct.intList* %r66, i1 0, i32 0
	%r68 = load i32, i32* %r67
	%r69 = add i32 %r65, %r68
	store i32 %r69, i32* %sum
	%r70 = load %struct.intList*, %struct.intList** %list
	%r71 = call i32 @length(%struct.intList* %r70 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r71)
	%r72 = load %struct.intList*, %struct.intList** %list
	%r73 = call %struct.intList* @deleteFirst(%struct.intList* %r72 )
	store %struct.intList* %r73, %struct.intList** %list
	%r79 = load %struct.intList*, %struct.intList** %list
	%r80 = call i32 @length(%struct.intList* %r79 )
	%r81 = icmp sgt i32 %r80, 0
	%r82 = zext i1 %r81 to i32
	%r83 = trunc i32 %r82 to i1
	br i1 %r83, label %L27, label %L28

L28:
	%r84 = load i32, i32* %sum
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r84)
	store i32 0, i32* %_retval_
	br label %L24
L24:
	%r85 = load i32, i32* %_retval_
	ret i32 %r85
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8