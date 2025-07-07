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

interface IVinScrollRelics {
    function getRelic(uint256 id) external view returns (
        string memory name,
        string memory effect,
        string memory origin,
        address holder,
        bool active,
        uint256 timestamp
    );
}

contract VinScrollVeilV3 {
    struct VeiledTruth {
        string hiddenMessage;
        uint256 requiredSigilId;
        uint256 requiredRelicId;
        uint256 maxPulseInterval;
        bool revealed;
    }

    VeiledTruth[] public truths;
    IVinScrollPulse public pulse;
    IVinScrollSigil public sigil;
    IVinScrollRelics public relics;
    address public immutable veilkeeper;

    event TruthRevealed(uint256 indexed id, address indexed revealer, string message, uint256 timestamp);

    modifier onlyVeilkeeper() {
        require(msg.sender == veilkeeper, "Not the veilkeeper");
        _;
    }

    constructor(address pulseAddr, address sigilAddr, address relicAddr) {
        pulse = IVinScrollPulse(pulseAddr);
        sigil = IVinScrollSigil(sigilAddr);
        relics = IVinScrollRelics(relicAddr);
        veilkeeper = msg.sender;
    }

    function addTruth(
        string calldata hiddenMessage,
        uint256 sigilId,
        uint256 relicId,
        uint256 maxPulseInterval
    ) external onlyVeilkeeper {
        truths.push(VeiledTruth({
            hiddenMessage: hiddenMessage,
            requiredSigilId: sigilId,
            requiredRelicId: relicId,
            maxPulseInterval: maxPulseInterval,
            revealed: false
        }));
    }

    function revealTruth(uint256 id) external {
        require(id < truths.length, "Invalid truth ID");
        VeiledTruth storage t = truths[id];
        require(!t.revealed, "Already revealed");

        (, , , address sigilBearer, bool sigilActive,) = sigil.getSigil(t.requiredSigilId);
        (, , , address relicHolder, bool relicActive,) = relics.getRelic(t.requiredRelicId);
        require(sigilActive && relicActive, "Sigil or relic inactive");
        require(sigilBearer == msg.sender && relicHolder == msg.sender, "You do not hold the required items");
        require(pulse.checkPulse(t.maxPulseInterval), "Pulse is unstable");

        t.revealed = true;
        emit TruthRevealed(id, msg.sender, t.hiddenMessage, block.timestamp);
    }

    function getTruth(uint256 id) external view returns (string memory) {
        require(id < truths.length, "Invalid truth ID");
        require(truths[id].revealed, "Truth still veiled");
        return truths[id].hiddenMessage;
    }

    function totalTruths() external view returns (uint256) {
        return truths.length;
    }
}
