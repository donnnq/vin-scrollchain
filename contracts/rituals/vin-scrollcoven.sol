// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollSigil {
    function getSigil(uint256 id) external view returns (
        string memory name,
        string memory effect,
        string memory alignment,
        address bearer,
        bool active,
        uint256 timestamp
    );
}

contract VinScrollCoven {
    struct CovenRitual {
        string name;
        uint256[] requiredSigils;
        address[] participants;
        bool executed;
    }

    CovenRitual[] public rituals;
    IVinScrollSigil public sigil;
    address public immutable covenMaster;

    event CovenRitualDefined(uint256 indexed id, string name);
    event CovenRitualCompleted(uint256 indexed id, address[] participants, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == covenMaster, "Not the coven master");
        _;
    }

    constructor(address sigilAddr) {
        sigil = IVinScrollSigil(sigilAddr);
        covenMaster = msg.sender;
    }

    function defineCovenRitual(
        string calldata name,
        uint256[] calldata sigilIds,
        address[] calldata participants
    ) external onlyMaster {
        require(sigilIds.length == participants.length, "Mismatch in sigils and participants");

        rituals.push(CovenRitual({
            name: name,
            requiredSigils: sigilIds,
            participants: participants,
            executed: false
        }));

        emit CovenRitualDefined(rituals.length - 1, name);
    }

    function completeCovenRitual(uint256 id) external {
        require(id < rituals.length, "Invalid ritual ID");
        CovenRitual storage r = rituals[id];
        require(!r.executed, "Already completed");

        for (uint256 i = 0; i < r.participants.length; i++) {
            (, , , address bearer, bool active,) = sigil.getSigil(r.requiredSigils[i]);
            require(active && bearer == r.participants[i], "Sigil not held or inactive");
        }

        r.executed = true;
        emit CovenRitualCompleted(id, r.participants, block.timestamp);
    }

    function getCovenRitual(uint256 id) external view returns (CovenRitual memory) {
        require(id < rituals.length, "Invalid ritual ID");
        return rituals[id];
    }

    function totalCovenRituals() external view returns (uint256) {
        return rituals.length;
    }
}
