// SPDX-License-Identifier: Scrollkeeper
pragma solidity ^0.8.0;

contract vinWaifuuSelectionRitual {
    address public scrollkeeper;
    uint public candidateCount;

    enum CharmLevel { Mild, Elegant, Spicy, Divine }

    struct WaifuuCandidate {
        string name;
        string talent;
        CharmLevel charm;
        uint auraScore;  // out of 100
        bool isSelected;
    }

    mapping(uint => WaifuuCandidate) public candidates;

    event CandidateSummoned(string name, string talent, CharmLevel charm, uint auraScore);
    event CandidateSelected(string name);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may select waifuu teachers");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function summonCandidate(
        string memory _name,
        string memory _talent,
        CharmLevel _charm,
        uint _auraScore
    ) public onlyScrollkeeper {
        candidates[candidateCount++] = WaifuuCandidate(_name, _talent, _charm, _auraScore, false);
        emit CandidateSummoned(_name, _talent, _charm, _auraScore);
    }

    function selectCandidate(uint _id) public onlyScrollkeeper {
        candidates[_id].isSelected = true;
        emit CandidateSelected(candidates[_id].name);
    }
}
