// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./vinForgivenessChamber.sol";

contract vinScrollRiteGallery {
    vinForgivenessChamber public chamber;

    constructor(address _chamber) {
        chamber = vinForgivenessChamber(_chamber);
    }

    struct RiteDisplay {
        address respondent;
        uint trialId;
        string message;
        uint votesFor;
        uint votesAgainst;
        vinForgivenessChamber.ForgivenessStatus status;
        uint timestamp;
    }

    function viewRite(uint trialId) external view returns (RiteDisplay memory) {
        (
            address respondent,
            ,
            string memory message,
            uint votesFor,
            uint votesAgainst,
            vinForgivenessChamber.ForgivenessStatus status,
            uint timestamp
        ) = chamber.rites(trialId);

        return RiteDisplay(respondent, trialId, message, votesFor, votesAgainst, status, timestamp);
    }
}
