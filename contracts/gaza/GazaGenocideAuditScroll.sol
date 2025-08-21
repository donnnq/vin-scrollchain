// GazaGenocideAuditScroll.sol
contract GazaGenocideAuditScroll {
    struct Violation {
        string timestamp;
        string location;
        string description;
        string perpetrator;
    }

    Violation[] public violations;

    function logViolation(
        string memory timestamp,
        string memory location,
        string memory description,
        string memory perpetrator
    ) public {
        violations.push(Violation(timestamp, location, description, perpetrator));
    }
}
