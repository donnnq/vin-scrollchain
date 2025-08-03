pragma solidity ^0.8.0;

contract vinTransparencyProbe {
    address public scrollGuardian;
    string public projectName;
    uint public totalBudget;
    string public constitutionLink;
    mapping(string => uint) public allocationByPurpose;
    mapping(address => string) public reviewerNotes;

    event ScrollFlagged(string purpose, uint amount, address flaggedBy);
    event CivicTruthRevealed(address revealer, string insight);

    modifier onlyReviewer() {
        require(msg.sender == scrollGuardian, "Not authorized reviewer.");
        _;
    }

    constructor(string memory _projectName, uint _totalBudget, string memory _constitutionLink) {
        scrollGuardian = msg.sender;
        projectName = _projectName;
        totalBudget = _totalBudget;
        constitutionLink = _constitutionLink;
    }

    function flagAllocation(string memory purpose, uint amount) public {
        allocationByPurpose[purpose] = amount;
        emit ScrollFlagged(purpose, amount, msg.sender);
    }

    function submitReviewerNote(string memory note) public onlyReviewer {
        reviewerNotes[msg.sender] = note;
        emit CivicTruthRevealed(msg.sender, note);
    }

    function getAllocation(string memory purpose) public view returns (uint) {
        return allocationByPurpose[purpose];
    }

    function revealTruth() public view returns (string memory) {
        return reviewerNotes[msg.sender];
    }
}
