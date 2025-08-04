// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract vinScrollSpeakerFactory {
    address public vinvin;
    mapping(address => bool) public verifiedInstitutions;
    mapping(bytes32 => string) public lawExplanations;

    event SpeakerSummoned(address indexed by, bytes32 scrollId, string explanation);
    event InstitutionVerified(address institution);
    event LawUpdated(bytes32 scrollId, string newExplanation);

    modifier onlyVinvin() {
        require(msg.sender == vinvin, "Not scroll author");
        _;
    }

    constructor() {
        vinvin = msg.sender;
    }

    function verifyInstitution(address _inst) public onlyVinvin {
        verifiedInstitutions[_inst] = true;
        emit InstitutionVerified(_inst);
    }

    function summonSpeaker(bytes32 scrollId) public {
        require(verifiedInstitutions[msg.sender], "Unverified institution");
        string memory explain = lawExplanations[scrollId];
        require(bytes(explain).length > 0, "No explanation found");
        emit SpeakerSummoned(msg.sender, scrollId, explain);
    }

    function updateLaw(bytes32 scrollId, string memory explanation) public onlyVinvin {
        lawExplanations[scrollId] = explanation;
        emit LawUpdated(scrollId, explanation);
    }
}
