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
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r2 = load i32, i32* @.read_scratch
	store i32 %r2, i32* %next
	%r3 = load i32, i32* %next
	%r4 = sub i32 0, 1
	%r5 = icmp eq i32 %r3, %r4
	%r6 = zext i1 %r5 to i32
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L3, label %L4

L3:
	%r8 = load i32, i32* %next
	%r9 = load %struct.IntList*, %struct.IntList** %list
	%r10 = getelementptr %struct.IntList , %struct.IntList* %r9, i1 0, i32 0
	store i32 %r8, i32* %r10
	%r11 = load %struct.IntList*, %struct.IntList** %list
	%r12 = getelementptr %struct.IntList , %struct.IntList* %r11, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %r12
	%r13 = load %struct.IntList*, %struct.IntList** %list
	store %struct.IntList* %r13, %struct.IntList** %_retval_
	br label %L2
L4:
	%r15 = load i32, i32* %next
	%r16 = load %struct.IntList*, %struct.IntList** %list
	%r17 = getelementptr %struct.IntList , %struct.IntList* %r16, i1 0, i32 0
	store i32 %r15, i32* %r17
	%r18 = call %struct.IntList* @getIntList()
	%r19 = load %struct.IntList*, %struct.IntList** %list
	%r20 = getelementptr %struct.IntList , %struct.IntList* %r19, i1 0, i32 1
	store %struct.IntList* %r18, %struct.IntList** %r20
	%r21 = load %struct.IntList*, %struct.IntList** %list
	store %struct.IntList* %r21, %struct.IntList** %_retval_
	br label %L2
L2:
	%r14 = load %struct.IntList*, %struct.IntList** %_retval_
	ret %struct.IntList* %r14
}

define i32 @biggest(i32 %_P_num1, i32 %_P_num2)
{

L7:
	%_retval_ = alloca i32
	%num1 = alloca i32
	store i32 %_P_num1, i32* %num1
	%num2 = alloca i32
	store i32 %_P_num2, i32* %num2
	%r23 = load i32, i32* %num1
	%r24 = load i32, i32* %num2
	%r25 = icmp sgt i32 %r23, %r24
	%r26 = zext i1 %r25 to i32
	%r27 = trunc i32 %r26 to i1
	br i1 %r27, label %L9, label %L10

L9:
	%r28 = load i32, i32* %num1
	store i32 %r28, i32* %_retval_
	br label %L8
L10:
	%r30 = load i32, i32* %num2
	store i32 %r30, i32* %_retval_
	br label %L8
L8:
	%r29 = load i32, i32* %_retval_
	ret i32 %r29
}

define i32 @biggestInList(%struct.IntList* %_P_list)
{

L13:
	%_retval_ = alloca i32
	%list = alloca %struct.IntList*
	store %struct.IntList* %_P_list, %struct.IntList** %list
	%big = alloca i32
	%r32 = load %struct.IntList*, %struct.IntList** %list
	%r33 = getelementptr %struct.IntList , %struct.IntList* %r32, i1 0, i32 0
	%r34 = load i32, i32* %r33
	store i32 %r34, i32* %big
	%r35 = load %struct.IntList*, %struct.IntList** %list
	%r36 = getelementptr %struct.IntList , %struct.IntList* %r35, i1 0, i32 1
	%r37 = load %struct.IntList*, %struct.IntList** %r36
	%r38 = icmp ne %struct.IntList* %r37, null
	%r39 = zext i1 %r38 to i32
	%r40 = trunc i32 %r39 to i1
	br i1 %r40, label %L15, label %L16

L15:
	%r41 = load i32, i32* %big
	%r42 = load %struct.IntList*, %struct.IntList** %list
	%r43 = getelementptr %struct.IntList , %struct.IntList* %r42, i1 0, i32 0
	%r44 = load i32, i32* %r43
	%r45 = call i32 @biggest(i32 %r41, i32 %r44 )
	store i32 %r45, i32* %big
	%r46 = load %struct.IntList*, %struct.IntList** %list
	%r47 = getelementptr %struct.IntList , %struct.IntList* %r46, i1 0, i32 1
	%r48 = load %struct.IntList*, %struct.IntList** %r47
	store %struct.IntList* %r48, %struct.IntList** %list
	%r49 = load %struct.IntList*, %struct.IntList** %list
	%r50 = getelementptr %struct.IntList , %struct.IntList* %r49, i1 0, i32 1
	%r51 = load %struct.IntList*, %struct.IntList** %r50
	%r52 = icmp ne %struct.IntList* %r51, null
	%r53 = zext i1 %r52 to i32
	%r54 = trunc i32 %r53 to i1
	br i1 %r54, label %L15, label %L16

L16:
	%r55 = load i32, i32* %big
	store i32 %r55, i32* %_retval_
	br label %L14
L14:
	%r56 = load i32, i32* %_retval_
	ret i32 %r56
}

define i32 @main()
{

L18:
	%_retval_ = alloca i32
	%list = alloca %struct.IntList*
	%r57 = call %struct.IntList* @getIntList()
	store %struct.IntList* %r57, %struct.IntList** %list
	%r58 = load %struct.IntList*, %struct.IntList** %list
	%r59 = call i32 @biggestInList(%struct.IntList* %r58 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r59)
	store i32 0, i32* %_retval_
	br label %L19
L19:
	%r60 = load i32, i32* %_retval_
	ret i32 %r60
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8