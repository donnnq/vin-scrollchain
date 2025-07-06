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

contract VinScrollSeal {
    struct Seal {
        string name;
        string targetType; // e.g. "Scroll", "Relic", "Sanctum"
        address targetAddress;
        uint256 requiredSigilId;
        bool sealed;
    }

    Seal[] public seals;
    IVinScrollSigil public sigil;
    address public immutable sealMaster;

    event SealCreated(uint256 indexed id, string name, address target);
    event SealBroken(uint256 indexed id, address by, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == sealMaster, "Not the seal master");
        _;
    }

    constructor(address sigilAddr) {
        sigil = IVinScrollSigil(sigilAddr);
        sealMaster = msg.sender;
    }

    function createSeal(
        string calldata name,
        string calldata targetType,
        address targetAddress,
        uint256 requiredSigilId
    ) external onlyMaster {
        seals.push(Seal({
            name: name,
            targetType: targetType,
            targetAddress: targetAddress,
            requiredSigilId: requiredSigilId,
            sealed: true
        }));

        emit SealCreated(seals.length - 1, name, targetAddress);
    }

    function breakSeal(uint256 id) external {
        require(id < seals.length, "Invalid seal ID");
        Seal storage s = seals[id];
        require(s.sealed, "Already unsealed");

        (, , , address bearer, bool active,) = sigil.getSigil(s.requiredSigilId);
        require(active && bearer == msg.sender, "You do not hold the required sigil");

        s.sealed = false;
        emit SealBroken(id, msg.sender, block.timestamp);
    }

    function isSealed(uint256 id) external view returns (bool) {
        require(id < seals.length, "Invalid seal ID");
        return seals[id].sealed;
    }

    function totalSeals() external view returns (uint256) {
        return seals.length;
    }
}
