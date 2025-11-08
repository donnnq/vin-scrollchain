pragma dignity ^2028.0;

contract BarangayClimateResilienceIndex {
    struct Barangay {
        string name;
        uint8 infrastructureScore;
        uint8 evacuationReadiness;
        uint8 public awareness;
    }

    mapping(string => Barangay) public index;

    event BarangayIndexed(string name, uint8 infra, uint8 evac, uint8 awareness);

    function indexBarangay(string memory name, uint8 infra, uint8 evac, uint8 awareness) public {
        index[name] = Barangay(name, infra, evac, awareness);
        emit BarangayIndexed(name, infra, evac, awareness);
    }
}
