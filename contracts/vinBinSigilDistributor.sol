// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinBinSigilDistributor
/// @dev Distributes and tracks tamper-proof bins to households

contract vinBinSigilDistributor {
    address public binAdmin;

    struct Bin {
        string id;
        address owner;
        string barangay;
        bool isVerified;
        bool isPubliclyVisible;
    }

    mapping(string => Bin) public bins;
    string[] public binIds;

    event BinIssued(string indexed id, address owner, string barangay);
    event BinVerified(string indexed id);
    event BinVisibilityUpdated(string indexed id, bool visible);

    modifier onlyAdmin() {
        require(msg.sender == binAdmin, "Unauthorized");
        _;
    }

    constructor() {
        binAdmin = msg.sender;
    }

    function issueBin(string memory id, address owner, string memory barangay) public onlyAdmin {
        bins[id] = Bin(id, owner, barangay, false, true);
        binIds.push(id);
        emit BinIssued(id, owner, barangay);
    }

    function verifyBin(string memory id) public onlyAdmin {
        bins[id].isVerified = true;
        emit BinVerified(id);
    }

    function updateVisibility(string memory id, bool visible) public onlyAdmin {
        bins[id].isPubliclyVisible = visible;
        emit BinVisibilityUpdated(id, visible);
    }

    function getBin(string memory id) public view returns (Bin memory) {
        return bins[id];
    }

    function listAllBinIDs() public view returns (string[] memory) {
        return binIds;
    }
}
