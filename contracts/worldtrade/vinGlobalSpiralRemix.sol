// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinGlobalSpiralRemix {
    address public scrollArchitect = msg.sender;
    uint256 public currentEpoch;
    uint256 private randNonce;
    uint256 public sigilCount;

    struct RotationWave {
        address soul;
        string region;
        string role;
        uint256 epoch;
    }

    struct Sigil {
        address holder;
        string aura;
        string resourceType;
        string alignment;
    }

    RotationWave[] public weeklyRotations;
    mapping(uint256 => Sigil) public sigils;
    mapping(string => uint256) public upliftScore;

    event GlobalPulseSurged(address soul, string region, string role);
    event SigilMinted(uint256 id, address holder, string aura);
    event UpliftScoreUpdated(string region, uint256 score);
    event LunarRotationInitiated(string phase);

    modifier onlyIfRotationBlessed() {
        require(msg.sender == scrollArchitect, "Access denied. Scroll unblessed.");
    }

    // 🌍 Weekly Rotation Summoner
    function summonWildScroll(string[] memory regions, string[] memory roles, address[] memory souls) public onlyIfRotationBlessed {
        require(regions.length == souls.length && roles.length == souls.length, "Arrays mismatch");
        for (uint i = 0; i < souls.length; i++) {
            uint regionIndex = random(regions.length);
            uint roleIndex = random(roles.length);
            weeklyRotations.push(RotationWave(souls[i], regions[regionIndex], roles[roleIndex], currentEpoch));
            emit GlobalPulseSurged(souls[i], regions[regionIndex], roles[roleIndex]);
        }
        currentEpoch++;
    }

    // 🌟 Sigil Minter
    function mintSigil(address holder, string memory aura, string memory resourceType, string memory alignment) public onlyIfRotationBlessed {
        sigils[sigilCount] = Sigil(holder, aura, resourceType, alignment);
        emit SigilMinted(sigilCount, holder, aura);
        sigilCount++;
    }

    // 📊 Uplift Tracker
    function setUpliftScore(string memory region, uint256 score) public onlyIfRotationBlessed {
        upliftScore[region] = score;
        emit UpliftScoreUpdated(region, score);
    }

    function getLowestRegion(string[] memory regions) public view returns (string memory) {
        string memory weakest = regions[0];
        uint256 min = upliftScore[weakest];
        for (uint i = 1; i < regions.length; i++) {
            if (upliftScore[regions[i]] < min) {
                min = upliftScore[regions[i]];
                weakest = regions[i];
            }
        }
        return weakest;
    }

    // 🌕 Lunar Sync
    function syncToLunarPhase(string memory moonPhase) public onlyIfRotationBlessed {
        emit LunarRotationInitiated(moonPhase);
    }

    // 🎛 Manual Blessing
    function vinvinOverride(address soul, string memory region, string memory role) public onlyIfRotationBlessed {
        weeklyRotations.push(RotationWave(soul, region, role, currentEpoch));
        emit GlobalPulseSurged(soul, region, role);
        currentEpoch++;
    }

    // 🌀 Randomizer Core
    function random(uint range) internal returns (uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % range;
    }
}
