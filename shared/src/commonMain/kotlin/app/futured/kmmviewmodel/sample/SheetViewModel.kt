package app.futured.kmmviewmodel.sample

import com.rickclephas.kmm.viewmodel.KMMViewModel
import com.rickclephas.kmm.viewmodel.stateIn
import com.rickclephas.kmp.nativecoroutines.NativeCoroutinesState
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.isActive
import kotlin.coroutines.coroutineContext

data class SheetViewState(
    val counter: Int,
    val text: String
)

open class SheetViewModel : KMMViewModel() {

    init {
        println("$this VM-sheet initialised")
    }

    @NativeCoroutinesState
    val viewState: StateFlow<SheetViewState> = flow {
        var counter = 0
        while (coroutineContext.isActive) {
            emit(SheetViewState(text = SampleData.Haikus.random(), counter = counter++))
            delay(500)
        }
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(), SheetViewState(text = "", counter = 0))
}
