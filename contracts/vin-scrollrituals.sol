// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollPulse {
    function checkPulse(uint256 maxInterval) external view returns (bool);
}

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

interface IVinScrollOracleV2 {
    function getOmen(string calldata key) external view returns (
        string memory key,
        string memory source,
        int256 value,
        uint256 timestamp
    );
}

contract VinScrollRituals {
    struct Ritual {
        string name;
        uint256 sigilId;
        string omenKey;
        int256 omenThreshold;
        uint256 maxPulseInterval;
        bool executed;
    }

    Ritual[] public rituals;
    IVinScrollPulse public pulse;
    IVinScrollSigil public sigil;
    IVinScrollOracleV2 public oracle;
    address public immutable ritualMaster;

    event RitualDefined(uint256 indexed id, string name);
    event RitualExecuted(uint256 indexed id, address indexed by, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == ritualMaster, "Not the ritual master");
        _;
    }

    constructor(address pulseAddr, address sigilAddr, address oracleAddr) {
        pulse = IVinScrollPulse(pulseAddr);
        sigil = IVinScrollSigil(sigilAddr);
        oracle = IVinScrollOracleV2(oracleAddr);
        ritualMaster = msg.sender;
    }

    function defineRitual(
        string calldata name,
        uint256 sigilId,
        string calldata omenKey,
        int256 omenThreshold,
        uint256 maxPulseInterval
    ) external onlyMaster {
        rituals.push(Ritual({
            name: name,
            sigilId: sigilId,
            omenKey: omenKey,
            omenThreshold: omenThreshold,
            maxPulseInterval: maxPulseInterval,
            executed: false
        }));

        emit RitualDefined(rituals.length - 1, name);
    }

    function executeRitual(uint256 id) external {
        require(id < rituals.length, "Invalid ritual ID");
        Ritual storage r = rituals[id];
        require(!r.executed, "Already executed");

        (, , , address bearer, bool sigilActive,) = sigil.getSigil(r.sigilId);
        require(sigilActive && bearer == msg.sender, "Sigil not held or inactive");
        require(pulse.checkPulse(r.maxPulseInterval), "Pulse unstable");

        (, , int256 omenValue,) = oracle.getOmen(r.omenKey);
        require(omenValue >= r.omenThreshold, "Omen not favorable");

        r.executed = true;
        emit RitualExecuted(id, msg.sender, block.timestamp);
    }

    function getRitual(uint256 id) external view returns (Ritual memory) {
        require(id < rituals.length, "Invalid ritual ID");
        return rituals[id];
    }

    function totalRituals() external view returns (uint256) {
        return rituals.length;
    }
}
