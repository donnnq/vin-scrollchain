pragma solidity ^0.8.0;

contract CropRegistry {
    struct Crop {
        string name;
        string category; // gulay, prutas, root crop
        string supplyNode; // farm, market, warehouse
        uint256 timestamp;
    }

    Crop[] public crops;

    event CropRegistered(string name, string category, string node);

    function registerCrop(string memory name, string memory category, string memory node) public {
        crops.push(Crop(name, category, node, block.timestamp));
        emit CropRegistered(name, category, node);
    }

    function getCrop(uint256 index) public view returns (Crop memory) {
        return crops[index];
    }

    function totalCrops() public view returns (uint256) {
        return crops.length;
    }
}
