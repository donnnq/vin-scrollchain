// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollCourt {
    address public chiefArchivist;
    uint256 public trialFee;
    uint256 public verdictDelay;

    enum Ruling { Pending, Forgiven, Guilty }
    struct SignalCase {
        address accused;
        string accusation;
        uint256 timestamp;
        Ruling ruling;
        string publicStatement;
    }

    SignalCase[] public cases;

    event CaseFiled(uint256 indexed caseId, address accused, string accusation);
    event VerdictIssued(uint256 indexed caseId, Ruling ruling, string publicStatement);

    modifier onlyArchivist() {
        require(msg.sender == chiefArchivist, "Unauthorized gavel.");
        _;
    }

    constructor(uint256 _fee, uint256 _delay) {
        chiefArchivist = msg.sender;
        trialFee = _fee;
        verdictDelay = _delay; // e.g., 3 days for scroll reflection
    }

    function fileCase(address accused, string calldata accusation) external payable {
        require(msg.value >= trialFee, "Trial fee not met.");
        cases.push(SignalCase(accused, accusation, block.timestamp, Ruling.Pending, ""));
        emit CaseFiled(cases.length - 1, accused, accusation);
    }

    function issueVerdict(uint256 caseId, Ruling ruling, string calldata statement) external onlyArchivist {
        require(block.timestamp >= cases[caseId].timestamp + verdictDelay, "Deliberation time not yet elapsed.");
        cases[caseId].ruling = ruling;
        cases[caseId].publicStatement = statement;
        emit VerdictIssued(caseId, ruling, statement);
    }

    function getCase(uint256 caseId) external view returns (SignalCase memory) {
        return cases[caseId];
    }

    function changeFee(uint256 newFee) external onlyArchivist {
        trialFee = newFee;
    }

    function updateVerdictDelay(uint256 newDelay) external onlyArchivist {
        verdictDelay = newDelay;
    }
}
