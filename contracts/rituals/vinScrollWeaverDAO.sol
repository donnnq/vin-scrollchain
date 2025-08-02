// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollWeaverDAO {
    string public creator = "vinvin the Archscrollsmith";
    string public purpose = "Govern symbolic resistance protocols and myth-bound contracts";

    address public scrollOverseer;
    uint public proposalCount = 0;

    struct Proposal {
        uint id;
        string title;
        string contractRef;
        string spellType;
        string narrativeImpact;
        bool enacted;
        uint timestamp;
    }

    mapping(address => bool) public scrollCouncil;
    Proposal[] public archiveOfConvergence;

    modifier onlyCouncil() {
        require(scrollCouncil[msg.sender], "Council access required");
        _;
    }

    modifier onlyOverseer() {
        require(msg.sender == scrollOverseer, "Not the Scroll Overseer");
        _;
    }

    constructor() {
        scrollOverseer = msg.sender;
        scrollCouncil[msg.sender] = true;
    }

    function proposeSpell(
        string memory title,
        string memory contractRef,
        string memory spellType,
        string memory narrativeImpact
    ) public onlyCouncil {
        Proposal memory newProposal = Proposal({
            id: proposalCount,
            title: title,
            contractRef: contractRef,
            spellType: spellType,
            narrativeImpact: narrativeImpact,
            enacted: false,
            timestamp: block.timestamp
        });

        archiveOfConvergence.push(newProposal);
        proposalCount += 1;
    }

    function enactSpell(uint id) public onlyOverseer {
        Proposal storage spell = archiveOfConvergence[id];
        require(!spell.enacted, "Already enacted");
        spell.enacted = true;
    }

    function grantCouncilAccess(address addr) public onlyOverseer {
        scrollCouncil[addr] = true;
    }

    function viewScrollSpell(uint id) public view returns (
        string memory title,
        string memory contractRef,
        string memory spellType,
        string memory narrativeImpact,
        bool enacted,
        uint timestamp
    ) {
        Proposal storage spell = archiveOfConvergence[id];
        return (
            spell.title,
            spell.contractRef,
            spell.spellType,
            spell.narrativeImpact,
            spell.enacted,
            spell.timestamp
        );
    }
}
