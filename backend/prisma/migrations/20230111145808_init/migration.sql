-- CreateTable
CREATE TABLE "School" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "school_name" VARCHAR(255) NOT NULL,
    "is_premium" BOOLEAN NOT NULL,
    "school_principal" VARCHAR(255) NOT NULL,

    CONSTRAINT "School_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Professor" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "professor_name" VARCHAR(255) NOT NULL,
    "professor_asignature" VARCHAR(255) NOT NULL,
    "professor_hobby" VARCHAR(200) NOT NULL,
    "professor_is_main" BOOLEAN NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "courseId" TEXT NOT NULL,

    CONSTRAINT "Professor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Student" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "school_id" INTEGER NOT NULL,
    "student_name" VARCHAR(255) NOT NULL,
    "student_gpa" DOUBLE PRECISION NOT NULL,
    "student_birth_date" TIMESTAMP(3) NOT NULL,
    "student_age" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Grade" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "grade_result" DOUBLE PRECISION NOT NULL,
    "grade_score" DOUBLE PRECISION NOT NULL,
    "grade_max_score" INTEGER NOT NULL,
    "grade_asignement" VARCHAR(255) NOT NULL,
    "student_id" INTEGER NOT NULL,

    CONSTRAINT "Grade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Course" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "course_total_amount" INTEGER NOT NULL,
    "professorId" TEXT NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "School_school_name_key" ON "School"("school_name");

-- AddForeignKey
ALTER TABLE "Professor" ADD CONSTRAINT "Professor_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Professor" ADD CONSTRAINT "Professor_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
