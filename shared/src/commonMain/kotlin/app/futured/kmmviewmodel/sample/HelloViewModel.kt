package app.futured.kmmviewmodel.sample

import com.rickclephas.kmm.viewmodel.KMMViewModel
import com.rickclephas.kmm.viewmodel.stateIn
import com.rickclephas.kmp.nativecoroutines.NativeCoroutinesState
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.isActive
import kotlin.coroutines.coroutineContext

data class HelloViewState(
    val id: Int,
    val number: Int = 0,
    val haiku: String = "",
)

open class HelloViewModel(private val id: Int) : KMMViewModel() {

    init {
        println("$this VM-$id initialised")
    }

    val counter = flow {
        var count = 0
        while (coroutineContext.isActive) {
            emit(count++)
            delay(500)
        }
    }

    val haikus = flow {
        while (coroutineContext.isActive) {
            emit(SampleData.Haikus.random())
            delay(5000)
        }
    }

    @NativeCoroutinesState
    val viewState: StateFlow<HelloViewState> = combine(counter, haikus) { counter, haiku ->
        HelloViewState(number = counter, haiku = haiku, id = id)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(), HelloViewState(id = id))
}
