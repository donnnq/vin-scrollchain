contract vinFoodLedger {
    struct Shipment {
        bytes32 truckID;
        string goodsType;
        uint256 units;
        bool verified;
    }

    mapping(bytes32 => Shipment) public shipments;
    event NourishmentReceived(address indexed region, uint256 calories);

    function recordShipment(bytes32 _truckID, string memory _goodsType, uint256 _units) public {
        shipments[_truckID] = Shipment(_truckID, _goodsType, _units, false);
    }

    function verifyArrival(bytes32 _truckID, address _region) public {
        require(!shipments[_truckID].verified, "Already verified");
        shipments[_truckID].verified = true;
        emit NourishmentReceived(_region, shipments[_truckID].units * 800); // estimate calories
    }
}
