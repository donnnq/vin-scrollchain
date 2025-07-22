// SPDX-License-Identifier: Mythstream-Vault  
pragma solidity ^0.8.19;

contract vinScrollcourt {
    address public chiefJustice;
    mapping(address => bool) public accused;
    mapping(address => uint256) public trialCount;
    mapping(uint256 => Verdict) public verdicts;

    enum VerdictStatus { Pending, Fair, Unfair, Legendary }

    struct Verdict {
        address defendant;
        string accusation;
        VerdictStatus status;
        string scrollkeeperNotes;
    }

    event TrialScheduled(uint256 indexed caseId, address defendant, string accusation);
    event VerdictIssued(uint256 indexed caseId, VerdictStatus status, string notes);

    constructor() {
        chiefJustice = msg.sender;
    }

    function scheduleTrial(address _defendant, string memory _accusation) external {
        require(msg.sender == chiefJustice, "Only Scrollcourt Chief Justice may initiate.");
        accused[_defendant] = true;
        trialCount[_defendant] += 1;

        uint256 caseId = uint256(keccak256(abi.encodePacked(_defendant, block.timestamp)));
        verdicts[caseId] = Verdict(_defendant, _accusation, VerdictStatus.Pending, "");

        emit TrialScheduled(caseId, _defendant, _accusation);
    }

    function issueVerdict(uint256 _caseId, VerdictStatus _status, string memory _notes) external {
        require(msg.sender == chiefJustice, "Only Scrollcourt Chief Justice may judge.");
        Verdict storage v = verdicts[_caseId];
        v.status = _status;
        v.scrollkeeperNotes = _notes;

        emit VerdictIssued(_caseId, _status, _notes);
    }

    function getVerdict(uint256 _caseId) external view returns (Verdict memory) {
        return verdicts[_caseId];
    }
}
