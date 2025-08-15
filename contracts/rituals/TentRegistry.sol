pragma mythic;

contract TentRegistry {
    struct TentDweller {
        string name;
        string location;
        string emotionalLog;
        string civicReceipt;
        bool verified;
    }

    TentDweller[] public dwellers;

    function registerDweller(
        string memory _name,
        string memory _location,
        string memory _log,
        string memory _receipt
    ) public {
        dwellers.push(TentDweller(_name, _location, _log, _receipt, true));
    }
}
