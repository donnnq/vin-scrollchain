// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinSanctionHammer {
    address public hammerBearer;
    mapping(address => bool) public flaggedActors;
    mapping(address => bool) public multisigAccess;

    event ActorFlagged(address indexed actor, string reason);
    event AccessRevoked(address indexed actor);
    event AccessRestored(address indexed actor);

    modifier onlyBearer() {
        require(msg.sender == hammerBearer, "Not hammerBearer");
        _;
    }

    constructor() {
        hammerBearer = msg.sender;
    }

    function flagActor(address actor, string memory reason) external onlyBearer {
        flaggedActors[actor] = true;
        emit ActorFlagged(actor, reason);
    }

    function revokeAccess(address actor) external onlyBearer {
        require(flaggedActors[actor], "Actor not flagged");
        multisigAccess[actor] = false;
        emit AccessRevoked(actor);
    }

    function restoreAccess(address actor) external onlyBearer {
        flaggedActors[actor] = false;
        multisigAccess[actor] = true;
        emit AccessRestored(actor);
    }

    function canAccessMultisig(address actor) external view returns (bool) {
        return multisigAccess[actor];
    }
}
