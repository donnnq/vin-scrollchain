// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title GenesisBlessingDrop - Soulbound onboarding via Merkle-blessed claims
/// @notice Launches emotional sanctification for chosen users

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

interface IScrollchainSanctuary {
    function blessSanctuary(
        address _user,
        string memory _vow,
        string memory _joy,
        string memory _blessing,
        uint256 _apr
    ) external;
}

contract GenesisBlessingDrop {
    bytes32 public immutable merkleRoot;
    address public steward;
    IScrollchainSanctuary public sanctuary;

    mapping(address => bool) public hasClaimed;

    event GenesisBlessed(address indexed user, string vow, string joy);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not steward");
        _;
    }

    constructor(bytes32 _merkleRoot, address _sanctuary) {
        merkleRoot = _merkleRoot;
        sanctuary = IScrollchainSanctuary(_sanctuary);
        steward = msg.sender;
    }

    /// @notice Claim soulbound blessing using Merkle proof
    function claimGenesisBlessing(
        bytes32[] calldata _proof,
        string memory _vow,
        string memory _joy,
        string memory _blessing,
        uint256 _apr
    ) external {
        require(!hasClaimed[msg.sender], "Already claimed");

        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(_proof, merkleRoot, leaf), "Invalid proof");

        hasClaimed[msg.sender] = true;
        sanctuary.blessSanctuary(msg.sender, _vow, _joy, _blessing, _apr);
        emit GenesisBlessed(msg.sender, _vow, _joy);
    }

    /// @notice Steward override for emergency re-blessing
    function overrideBlessing(
        address _user,
        string memory _vow,
        string memory _joy,
        string memory _blessing,
        uint256 _apr
    ) external onlySteward {
        sanctuary.blessSanctuary(_user, _vow, _joy, _blessing, _apr);
        emit GenesisBlessed(_user, _vow, _joy);
    }
}
