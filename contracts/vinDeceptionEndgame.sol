// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinDeceptionEndgame {
    address public endgameCurator;
    mapping(address => bool) public flaggedActors;
    mapping(address => bool) public restoredActors;
    mapping(address => string) public publicTestimony;

    event RedemptionRequested(address indexed actor, string testimony);
    event ActorRestored(address indexed actor);
    event RestorationDenied(address indexed actor);

    modifier onlyCurator() {
        require(msg.sender == endgameCurator, "Not endgame curator");
        _;
    }

    constructor() {
        endgameCurator = msg.sender;
    }

    function requestRedemption(address actor, string memory testimony) external {
        require(flaggedActors[actor], "Actor not flagged");
        publicTestimony[actor] = testimony;
        emit RedemptionRequested(actor, testimony);
    }

    function reviewAndRestore(address actor, bool approve) external onlyCurator {
        require(bytes(publicTestimony[actor]).length > 0, "No testimony submitted");

        if (approve) {
            restoredActors[actor] = true;
            flaggedActors[actor] = false;
            emit ActorRestored(actor);
        } else {
            emit RestorationDenied(actor);
        }
    }

    function isRestored(address actor) external view returns (bool) {
        return restoredActors[actor];
    }
}
