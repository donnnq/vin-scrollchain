// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollSigilBind {
    enum TargetType { Soul, Scroll, Sanctum }

    struct Binding {
        uint256 sigilId;
        TargetType targetType;
        address targetAddress;
        string purpose;
        bool active;
        uint256 timestamp;
    }

    Binding[] public bindings;
    address public immutable bindMaster;

    event SigilBound(uint256 indexed id, uint256 sigilId, TargetType targetType, address target, string purpose, uint256 timestamp);
    event SigilUnbound(uint256 indexed id, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == bindMaster, "Not the bind master");
        _;
    }

    constructor() {
        bindMaster = msg.sender;
    }

    function bindSigil(
        uint256 sigilId,
        TargetType targetType,
        address targetAddress,
        string calldata purpose
    ) external onlyMaster {
        bindings.push(Binding({
            sigilId: sigilId,
            targetType: targetType,
            targetAddress: targetAddress,
            purpose: purpose,
            active: true,
            timestamp: block.timestamp
        }));

        emit SigilBound(bindings.length - 1, sigilId, targetType, targetAddress, purpose, block.timestamp);
    }

    function unbindSigil(uint256 id) external onlyMaster {
        require(id < bindings.length, "Invalid binding ID");
        bindings[id].active = false;
        emit SigilUnbound(id, block.timestamp);
    }

    function getBinding(uint256 id) external view returns (Binding memory) {
        require(id < bindings.length, "Invalid binding ID");
        return bindings[id];
    }

    function totalBindings() external view returns (uint256) {
        return bindings.length;
    }
}
