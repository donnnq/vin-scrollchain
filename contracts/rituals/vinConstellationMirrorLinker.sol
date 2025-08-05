pragma solidity ^0.8.0;

interface IScrollRegistry {
    function getTotalScrolls() external view returns (uint256);
}

contract vinConstellationMirrorLinker {
    address public registryAddress;

    constructor(address _registryAddress) {
        registryAddress = _registryAddress;
    }

    function mirrorConstellation() public view returns (uint256 activeScrolls) {
        IScrollRegistry registry = IScrollRegistry(registryAddress);
        activeScrolls = registry.getTotalScrolls();
    }
}
