pragma solidity ^0.8.20;

contract vinLegislativeConflictAuditScroll {
    address public steward;

    struct Allegation {
        address legislator;
        string name;
        string region;
        string projectType;
        string relativeContractor;
        string evidenceHash;
        bool flagged;
    }

    mapping(address => Allegation[]) public auditTrail;

    event SelfDealingFlagged(address indexed legislator, string projectType, string relativeContractor);

    constructor() {
        steward = msg.sender;
    }

    function fileAllegation(
        address _legislator,
        string memory _name,
        string memory _region,
        string memory _projectType,
        string memory _relativeContractor,
        string memory _evidenceHash
    ) public {
        auditTrail[_legislator].push(Allegation(
            _legislator,
            _name,
            _region,
            _projectType,
            _relativeContractor,
            _evidenceHash,
            true
        ));
        emit SelfDealingFlagged(_legislator, _projectType, _relativeContractor);
    }

    function viewAllegations(address _legislator) public view returns (Allegation[] memory) {
        return auditTrail[_legislator];
    }
}
