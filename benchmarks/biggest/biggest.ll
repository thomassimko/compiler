target triple="i686"

%struct.IntList = type {i32, %struct.IntList*}

define %struct.IntList* @getIntList()
{

L1:
	%_retval_ = alloca %struct.IntList*
	%list = alloca %struct.IntList*
	%next = alloca i32
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.IntList*
	store %struct.IntList* %r1, %struct.IntList** %list
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %next)
	%r2 = load i32, i32* %next
	%r3 = sub i32 0, 1
	%r4 = icmp eq i32 %r2, %r3
	%r5 = zext i1 %r4 to i32
	%r6 = trunc i32 %r5 to i1
	br i1 %r6, label %L3, label %L4

L3:
	%r7 = load %struct.IntList*, %struct.IntList** %list
	%r8 = getelementptr %struct.IntList , %struct.IntList* %r7, i1 0, i32 0
	%r9 = load i32, i32* %next
	store i32 %r9, i32* %r8
	%r10 = load %struct.IntList*, %struct.IntList** %list
	%r11 = getelementptr %struct.IntList , %struct.IntList* %r10, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %r11
	%r12 = load %struct.IntList*, %struct.IntList** %list
	store %struct.IntList* %r12, %struct.IntList** %_retval_
	br label %L2
L4:
	%r14 = load %struct.IntList*, %struct.IntList** %list
	%r15 = getelementptr %struct.IntList , %struct.IntList* %r14, i1 0, i32 0
	%r16 = load i32, i32* %next
	store i32 %r16, i32* %r15
	%r17 = load %struct.IntList*, %struct.IntList** %list
	%r18 = getelementptr %struct.IntList , %struct.IntList* %r17, i1 0, i32 1
	%r19 = call %struct.IntList* @getIntList()
	store %struct.IntList* %r19, %struct.IntList** %r18
	%r20 = load %struct.IntList*, %struct.IntList** %list
	store %struct.IntList* %r20, %struct.IntList** %_retval_
	br label %L2
L5:
	br label %L2
L2:
	%r13 = load %struct.IntList*, %struct.IntList** %_retval_
	ret %struct.IntList* %r13
}

define i32 @biggest(i32 %_P_num1, i32 %_P_num2)
{

L9:
	%_retval_ = alloca i32
	%num1 = alloca i32
	store i32 %_P_num1, i32* %num1
	%num2 = alloca i32
	store i32 %_P_num2, i32* %num2
	%r22 = load i32, i32* %num1
	%r23 = load i32, i32* %num2
	%r24 = icmp sgt i32 %r22, %r23
	%r25 = zext i1 %r24 to i32
	%r26 = trunc i32 %r25 to i1
	br i1 %r26, label %L11, label %L12

L11:
	%r27 = load i32, i32* %num1
	store i32 %r27, i32* %_retval_
	br label %L10
L12:
	%r29 = load i32, i32* %num2
	store i32 %r29, i32* %_retval_
	br label %L10
L13:
	br label %L10
L10:
	%r28 = load i32, i32* %_retval_
	ret i32 %r28
}

define i32 @biggestInList(%struct.IntList* %_P_list)
{

L17:
	%_retval_ = alloca i32
	%list = alloca %struct.IntList*
	store %struct.IntList* %_P_list, %struct.IntList** %list
	%big = alloca i32
	%r31 = load %struct.IntList*, %struct.IntList** %list
	%r32 = getelementptr %struct.IntList , %struct.IntList* %r31, i1 0, i32 0
	%r33 = load i32, i32* %r32
	store i32 %r33, i32* %big
	%r42 = load %struct.IntList*, %struct.IntList** %list
	%r43 = getelementptr %struct.IntList , %struct.IntList* %r42, i1 0, i32 1
	%r44 = load %struct.IntList*, %struct.IntList** %r43
	%r45 = icmp ne %struct.IntList* %r44, null
	%r46 = zext i1 %r45 to i32
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L19, label %L20

L19:
	%r34 = load i32, i32* %big
	%r35 = load %struct.IntList*, %struct.IntList** %list
	%r36 = getelementptr %struct.IntList , %struct.IntList* %r35, i1 0, i32 0
	%r37 = load i32, i32* %r36
	%r38 = call i32 @biggest(i32 %r34, i32 %r37 )
	store i32 %r38, i32* %big
	%r39 = load %struct.IntList*, %struct.IntList** %list
	%r40 = getelementptr %struct.IntList , %struct.IntList* %r39, i1 0, i32 1
	%r41 = load %struct.IntList*, %struct.IntList** %r40
	store %struct.IntList* %r41, %struct.IntList** %list
	%r48 = load %struct.IntList*, %struct.IntList** %list
	%r49 = getelementptr %struct.IntList , %struct.IntList* %r48, i1 0, i32 1
	%r50 = load %struct.IntList*, %struct.IntList** %r49
	%r51 = icmp ne %struct.IntList* %r50, null
	%r52 = zext i1 %r51 to i32
	%r53 = trunc i32 %r52 to i1
	br i1 %r53, label %L19, label %L20

L20:
	%r54 = load i32, i32* %big
	store i32 %r54, i32* %_retval_
	br label %L18
L18:
	%r55 = load i32, i32* %_retval_
	ret i32 %r55
}

define i32 @main()
{

L22:
	%_retval_ = alloca i32
	%list = alloca %struct.IntList*
	%r56 = call %struct.IntList* @getIntList()
	store %struct.IntList* %r56, %struct.IntList** %list
	%r57 = load %struct.IntList*, %struct.IntList** %list
	%r58 = call i32 @biggestInList(%struct.IntList* %r57 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r58)
	store i32 0, i32* %_retval_
	br label %L23
L23:
	%r59 = load i32, i32* %_retval_
	ret i32 %r59
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8