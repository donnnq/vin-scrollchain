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

interface IVinScrollOracleV2 {
    function getOmen(string calldata key) external view returns (
        string memory key,
        string memory source,
        int256 value,
        uint256 timestamp
    );
}

contract VinScrollVeilVault {
    struct VaultEntry {
        string name;
        address grimoireAddress;
        uint256 requiredSigilId;
        uint256 requiredRelicId;
        string omenKey;
        int256 omenThreshold;
        bool unlocked;
    }

    VaultEntry[] public vaults;
    IVinScrollSigil public sigil;
    IVinScrollRelics public relics;
    IVinScrollOracleV2 public oracle;
    address public immutable vaultKeeper;

    event VaultSealed(uint256 indexed id, string name, address grimoire);
    event VaultUnlocked(uint256 indexed id, address by, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == vaultKeeper, "Not the vault keeper");
        _;
    }

    constructor(address sigilAddr, address relicAddr, address oracleAddr) {
        sigil = IVinScrollSigil(sigilAddr);
        relics = IVinScrollRelics(relicAddr);
        oracle = IVinScrollOracleV2(oracleAddr);
        vaultKeeper = msg.sender;
    }

    function sealVault(
        string calldata name,
        address grimoireAddress,
        uint256 sigilId,
        uint256 relicId,
        string calldata omenKey,
        int256 omenThreshold
    ) external onlyKeeper {
        vaults.push(VaultEntry({
            name: name,
            grimoireAddress: grimoireAddress,
            requiredSigilId: sigilId,
            requiredRelicId: relicId,
            omenKey: omenKey,
            omenThreshold: omenThreshold,
            unlocked: false
        }));

        emit VaultSealed(vaults.length - 1, name, grimoireAddress);
    }

    function unlockVault(uint256 id) external {
        require(id < vaults.length, "Invalid vault ID");
        VaultEntry storage v = vaults[id];
        require(!v.unlocked, "Already unlocked");

        (, , , address sigilBearer, bool sigilActive,) = sigil.getSigil(v.requiredSigilId);
        (, , , address relicHolder, bool relicActive,) = relics.getRelic(v.requiredRelicId);
        (, , int256 omenValue,) = oracle.getOmen(v.omenKey);

        require(sigilActive && relicActive, "Sigil or relic inactive");
        require(sigilBearer == msg.sender && relicHolder == msg.sender, "You do not hold the required items");
        require(omenValue >= v.omenThreshold, "Omen not favorable");

        v.unlocked = true;
        emit VaultUnlocked(id, msg.sender, block.timestamp);
    }

    function isUnlocked(uint256 id) external view returns (bool) {
        require(id < vaults.length, "Invalid vault ID");
        return vaults[id].unlocked;
    }

    function totalVaults() external view returns (uint256) {
        return vaults.length;
    }
}
