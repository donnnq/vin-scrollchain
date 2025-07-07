// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollTomb {
    function getTombstone(uint256 id) external view returns (
        uint8 tombType,
        string memory name,
        string memory reason,
        address formerHolder,
        uint256 timestamp
    );
}

contract VinScrollRebirth {
    struct Rebirth {
        uint256 tombId;
        string newName;
        string transformation;
        address rebornBy;
        uint256 timestamp;
    }

    Rebirth[] public rebirths;
    IVinScrollTomb public tomb;
    address public immutable rebirthKeeper;

    event ScrollReborn(uint256 indexed tombId, string newName, string transformation, address rebornBy, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == rebirthKeeper, "Not the rebirth keeper");
        _;
    }

    constructor(address tombAddr) {
        tomb = IVinScrollTomb(tombAddr);
        rebirthKeeper = msg.sender;
    }

    function rebirthScroll(
        uint256 tombId,
        string calldata newName,
        string calldata transformation
    ) external onlyKeeper {
        (, string memory oldName, , , ) = tomb.getTombstone(tombId);

        rebirths.push(Rebirth({
            tombId: tombId,
            newName: newName,
            transformation: transformation,
            rebornBy: msg.sender,
            timestamp: block.timestamp
        }));

        emit ScrollReborn(tombId, newName, transformation, msg.sender, block.timestamp);
    }

    function getRebirth(uint256 id) external view returns (Rebirth memory) {
        require(id < rebirths.length, "Invalid rebirth ID");
        return rebirths[id];
    }

    function totalRebirths() external view returns (uint256) {
        return rebirths.length;
    }
}
