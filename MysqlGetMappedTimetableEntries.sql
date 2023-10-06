SELECT 
	timetable.TimeTableId, 
    timetable.DayOfTheWeek,
    teacherSubject.TeacherSubjectId,
    subjects.Code,
    subjects.SubjectName,
    subjectcategory.SubjectCategoryId,
    subjectcategory.SubjectCategoryName,
    teacher.TeacherId,
    teacher.TeacherType,
    teacher.TSCNumber,
    staff.NationalId,
    staff.FirstName,
    staff.MiddleName,
    staff.Surname,
    staff.PhoneNumber,
    staff.Gender,
    staff.EmploymentDate,
    staff.Designation,
    staff.DateOfBirth,
    class.ClassId,
    form.FormId,
    form.Form,
    stream.StreamId,
    stream.Stream,
    sessionyear.SessionYearId,
    sessionyear.StartDate,
    sessionyear.EndDate,
    timeslot.TimeslotId,
    timeslot.StartTime,
    timeslot.EndTime,
    timeslot.IsBeforeBreak,
    timeslot.IsAfterBreak 
FROM timetable 
INNER JOIN timetableTeacherSubject ON timetableTeacherSubject.TimeTableId = timetable.TimeTableId 
INNER JOIN teacherSubject ON teacherSubject.TeacherSubjectId = timetableTeacherSubject.TeacherSubjectId 
INNER JOIN subjects ON subjects.Code = teacherSubject.Code 
inner join subjectcategory on subjects.SubjectCategoryId = subjectcategory.SubjectCategoryId  
INNER JOIN teacher ON teacher.TeacherId = teacherSubject.TeacherId 
inner join staff on teacher.NationalId = staff.NationalId 
inner join class on timetable.ClassId = class.ClassId 
inner join form on class.FormId = form.FormId 
inner join stream on class.StreamId = stream.StreamId 
inner join sessionyear on class.SessionYearId = sessionyear.SessionYearId 
inner join timeslot on timetable.TimeslotId = timeslot.TimeslotId 
where class.ClassId = 6; 