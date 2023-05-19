abstract class AddUserEvent {}

class SubmitButtonClickedEvent extends AddUserEvent {
  final String name;
  final String jobName;
  SubmitButtonClickedEvent(this.name, this.jobName);
}
