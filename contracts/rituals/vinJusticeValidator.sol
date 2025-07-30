contract vinJusticeValidator {
    mapping(address => bool) public dignityCompliant;
    event ComplianceConfirmed(address indexed subject);
    event ViolationLogged(address indexed subject);

    function confirmCompliance(address subject) public {
        dignityCompliant[subject] = true;
        emit ComplianceConfirmed(subject);
    }

    function logViolation(address subject) public {
        dignityCompliant[subject] = false;
        emit ViolationLogged(subject);
    }

    function isCompliant(address subject) public view returns (bool) {
        return dignityCompliant[subject];
    }
}
